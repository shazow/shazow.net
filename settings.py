import os

path = lambda p: os.path.join(os.path.abspath(os.path.dirname(__file__)), p)


build_path = path("./build")
source_path = path("./_templates")


def _mako_filter(content):
    from mako.lookup import TemplateLookup
    from mako.template import Template

    template_lookup = TemplateLookup(
        directories=['./templates'],
        input_encoding='utf-8', output_encoding='utf-8',
        encoding_errors='replace',
    )

    t = Template(content, lookup=template_lookup)

    return t.render()


from markdown import markdown as _markdown_filter



filters = {
    'mako': _mako_filter,
    'markdown': _markdown_filter,
}


from composer.traverser import ManifestTraverser

traverser = ManifestTraverser(path("./MANIFEST"), filters)
