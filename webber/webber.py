#!/usr/bin/env python
"""
Given a controller and a route generator, create a bunch of corresponding
static HTML.
"""

import argparse

import logging

log = logging.getLogger(__name__)


## Helpers:

import os

def invent_url_from_path(path, prefix=None):
    path = path.split(prefix, 1)[-1]
    return path.split('/')[-1].replace(' ', '-') # FIXME: Something more reasonable, lol


def walk_suffix(suffix, base_path='.'):
    for root, dirs, files in os.walk(base_path):
        for f in files:
            if f.endswith(suffix):
                yield f


## Controller:

from mako.lookup import TemplateLookup


class BaseController(object):
    pass


class MakoController(BaseController):
    def __init__(self, **template_lookup_kw):
        self.template_lookup = TemplateLookup(**template_lookup_kw)

    def __call__(self, template_name=None, **render_kw):
        t = self.template_lookup.get_template(template_name)
        return t.render(**render_kw)


## Router:

class MyRouter(object):
    """
    :param base_path:
        Base filesystem path where the input content lives.
    """
    def __init__(self, base_path):
        self.controller = MakoController(directories=[base_path],
            input_encoding='utf-8', output_encoding='utf-8',
            encoding_errors='replace')

        self.base_path = base_path

    def __call__(self):
        for path in walk_suffix('.html.mako', base_path=self.base_path):
            yield invent_url_from_path(path, 'index.html.mako'), self.controller(path)


## Writer:

def manifest_url_content_into_path(base_path, url, content, index_file='index.html'):
    url_path = os.path.join(base_path, url)

    try:
        os.makedirs(url_path)
    except os.error:
        pass # Already exists, honeybadger doesn't care.

    fp = open(os.path.join(url_path, index_file), 'w')
    fp.write(content)
    fp.close()


class MyWriter(object):
    """
    :param base_path:
        Base filesystem path for where the static HTML structure should be
        created.
    """
    def __init__(self, base_path):
        self.base_path = base_path

        try:
            os.makedirs(base_path)
        except os.error:
            pass # Already exists, honeybadger doesn't care.

    def __call__(self, router):

        for url, content in router:
            log.info("Writing url: ", url)
            manifest_url_content_into_path(self.base_path, url, content)


## Script:

def main():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument('-b', '--build-dir', dest='build_dir')
    parser.add_argument('-s', '--source-dir', dest='source_dir')

    args = parser.parse_args()

    router = MyRouter(os.path.abspath(args.source_dir))
    writer = MyWriter(os.path.abspath(args.build_dir))

    writer(router())


if __name__ == "__main__":
    main()
