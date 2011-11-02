#!/usr/bin/env python

import time
import commands

from composer.index import Index, Route, Static
from composer.filters import MakoContainer, Mako, Markdown


def git_metadata(work_dir, file):
    """
    Given a repo and a file within it, get the author, email, time created, and time updated.
    """
    cmd = 'git --git-dir=%s/.git log --pretty="%%an\t%%ae\t%%at" -- %s' % (work_dir, file)
    name, email, updated = commands.getoutput(cmd + ' | head -n1').split('\t')
    _, _, created = commands.getoutput(cmd + ' | tail -n1').split('\t')

    r = {'name': name, 'email': email, 'time_created': created}
    if created != updated:
        r['time_updated'] = updated

    return r

def markdown_title(file):
    for line in open(file):
        if line.startswith('# '):
            return line[2:].strip()


def strip_ends(s, prefix='', suffix=''):
    return s[len(prefix):-len(suffix) or None]


class ShazowIndex(Index):
    def _register_filters(self):
        self.register_filter('post', MakoContainer, {'directories': ['_templates'], 'template': 'post.mako'})
        self.register_filter('mako', Mako, {'directories': ['_templates']})
        self.register_filter('markdown', Markdown, {'extras': ['smarty-pants', 'code-color']})

    def _generate_static(self):
        yield Static('/', file='_static')

    def _generate_routes(self):
        # Fixed pages
        for file in self.walk('_templates', include_only=['*.html.mako']):
            url = strip_ends(file, '_templates/', '.html.mako')
            url = self.absolute_url(url.replace('index', ''))

            filters = ['mako']
            context = {'title': 'Andrey Petrov | shazow.net'}

            yield Route(url, file=file, filters=filters, context=context)

        # From my blog submodule
        for file in self.walk('_everything', include_only=['_everything/*/*.md']):
            url = strip_ends(file, '_everything/', '.md')
            category = url.split('/', 1)[0]
            url = self.absolute_url(url.replace('index', ''))

            filters = ['markdown', 'post']

            context = git_metadata('_everything', self.relative_path(file, '_everything'))
            context['title'] = markdown_title(self.absolute_path(file)) or 'Untitled'
            context['tags'] = ['post', category]

            yield Route(url, file=file, filters=filters, context=context)

        # TODO: Generate table of contents based on tags


if __name__ == '__main__':
    import json
    import os

    index = ShazowIndex(os.path.dirname(__file__))
    print json.dumps(index.to_dict(), indent=4)
