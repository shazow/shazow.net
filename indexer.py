#!/usr/bin/env python

import commands

from composer.index import Index, Route, Static
from composer.filters import MakoContainer, Mako, Markdown


def git_metadata(work_dir, file):
    """
    Given a repo and a file within it, get the author, email, time created, and time updated.
    """
    cmd = 'git --git-dir=%s/.git log --follow --pretty="%%an\t%%ae\t%%at" -- %s' % (work_dir, file)

    history = commands.getoutput(cmd)
    if not history:
        return {}

    history = history.split('\n')

    name, email, updated = history[0].split('\t')

    if len(history) > 1:
        _, _, created = history[-1].split('\t')
    else:
        created = updated

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
        self.register_filter('markdown', Markdown, {
            'extensions': ['extra', 'headerid', 'smartypants'],
        })

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
        for file in self.walk('_everything', include_only=['_everything/*.md'], exclude=['_everything/README.md']):
            url = strip_ends(file, '_', '.md') # _everything/foo.md -> everything/foo
            url = self.absolute_url(url.replace('index', ''))

            filters = ['markdown', 'post', 'pygments']

            context = git_metadata('_everything', self.relative_path(file, '_everything'))
            context['title'] = markdown_title(self.absolute_path(file)) or 'Untitled'
            context['tags'] = ['post']

            yield Route(url, file=file, filters=filters, context=context)

        # TODO: Generate table of contents based on tags


if __name__ == '__main__':
    import json
    import os

    index = ShazowIndex(os.path.dirname(__file__))
    print json.dumps(index.to_dict(), sort_keys=True, indent=4)
