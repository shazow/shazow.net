#!/usr/bin/env python

import commands

from composer.index import Index, Route, Static
from composer.filters import MakoContainer


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


class ShazowIndex(Index):

    def _register_filters(self):
        super(ShazowIndex, self)._register_filters()
        self.register_filter('post', MakoContainer, {'directories': ['_templates'], 'template': 'post.mako'})

    def _generate_static(self):
        yield Static('static', file='_static')

    def _generate_routes(self):
        # Fixed pages
        for file in self.walk('_templates', include_only=['*.html.mako']):
            url = file[:-len('.html.mako')]
            url = self.absolute_url(url.replace('index', ''))

            yield Route(url, file=file, filters=['mako'], context={'title': 'Andrey Petrov | shazow.net'})

        # From my blog submodule
        for file in self.walk('_everything', include_only=['*/*.md']):
            url = file[:-len('.md')]

            context = git_metadata('_everything', file)
            context['title'] = '%s | shazow.net' % markdown_title(self.absolute_path(file, '_everything')) or 'Untitled'

            yield Route(url, file=file, filters=['markdown', 'mako'], context=context)


if __name__ == '__main__':
    import json
    index = ShazowIndex()
    print json.dumps(index.to_dict(), indent=4)
