import json
import re
import subprocess
import unittest
from html.parser import HTMLParser
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / "build"


class LinkParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.hrefs = []
        self.links = []

    def handle_starttag(self, tag, attrs):
        attributes = dict(attrs)
        if tag == "a":
            if "href" in attributes:
                self.hrefs.append(attributes["href"])
        elif tag == "link":
            self.links.append(attributes)


class AgentReadinessTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        subprocess.run(
            ["hugo", "--gc", "--minify", "--baseURL", "https://shazow.net/"],
            cwd=ROOT,
            check=True,
        )

    def test_custom_404_gives_agents_recovery_links(self):
        page = (BUILD / "404.html").read_text(encoding="utf-8")
        parser = LinkParser()
        parser.feed(page)

        self.assertIn("Page not found", page)
        for target in ("/", "/posts/", "/sitemap.xml", "/llms.txt"):
            self.assertIn(target, parser.hrefs)

    def test_homepage_identifies_andrey_with_person_json_ld(self):
        page = (BUILD / "index.html").read_text(encoding="utf-8")
        match = re.search(
            r'<script type=(?:"application/ld\+json"|application/ld\+json)>(.*?)</script>',
            page,
            re.DOTALL,
        )

        if match is None:
            self.fail("homepage should contain JSON-LD")
        data = json.loads(match.group(1))
        self.assertEqual(data["@context"], "https://schema.org")
        self.assertEqual(data["@type"], "Person")
        self.assertEqual(data["name"], "Andrey Petrov")
        self.assertEqual(data["alternateName"], "shazow")
        self.assertEqual(data["url"], "https://shazow.net/")
        self.assertTrue(data["description"])
        self.assertIn("https://github.com/shazow", data["sameAs"])

    def test_llms_txt_follows_the_published_structure_and_gives_guidance(self):
        text = (BUILD / "llms.txt").read_text(encoding="utf-8")
        lines = text.splitlines()

        self.assertEqual(lines[0], "# shazow.net")
        self.assertTrue(lines[2].startswith("> "))
        self.assertIn("## When to use this site", text)
        self.assertIn("## Developer resources", text)
        self.assertIn("https://github.com/shazow", text)
        self.assertIn("https://github.com/shazow/shazow.net", text)
        self.assertIn("https://shazow.net/sitemap.xml", text)

        for line in lines:
            if line.startswith("###"):
                self.fail("llms.txt file-list sections must use H2 headings")

    def test_pages_advertise_the_covering_llms_txt(self):
        page = (BUILD / "index.html").read_text(encoding="utf-8")
        parser = LinkParser()
        parser.feed(page)

        self.assertIn(
            {"rel": "describedby", "href": "/llms.txt"},
            parser.links,
        )


if __name__ == "__main__":
    unittest.main()
