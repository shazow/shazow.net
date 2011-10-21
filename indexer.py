#!/usr/bin/env python

import json
import os
import commands

def path(p):
    return os.path.join(os.path.dirname(__file__), p)


def git_metadata(work_dir, file):
    cmd = 'git --git-dir=%s/.git log --pretty="%%an\t%%ae\t%%at" -- %s' % (work_dir, file)
    name, email, updated = commands.getoutput(cmd + ' | head -n1').split('\t')
    _, _, created = commands.getoutput(cmd + ' | tail -n1').split('\t')

    return name, email, created, updated

##

def index_git_repo(work_dir):
    for root, dirs, files in os.walk(work_dir):
        if root.startswith(os.path.join(work_dir, '.git')) or root == work_dir:
            continue

        for file in files:
            file = os.path.relpath(os.path.join(root, file), work_dir)
            name, email, created, updated = git_metadata(work_dir, file)
            route = {
                'file': os.path.join(root, file),
                'url': file.split('.', 1)[0],    # <-- TODO: Generalize these
                'filters': ['markdown', 'post'], # <--
                'tags': ['post'],                # <--
                'context': {
                    'time_created': created,
                    'author_name': name,
                    'author_email': email,
                }
            }
            # TODO: Extract title
            if created != updated:
                route['context']['time_updated'] = updated

            yield route

routes = list(index_git_repo(path('_everything')))

filters = {
    'mako': {
        'class': 'composer.filters:Mako',
        'kwargs': {'directories': ['_templates']},
    },
    'post': {
        'class': 'composer.filters:MakoContainer',
        'kwargs': {'directories': ['_templates'], 'template': 'post.mako'},
    },
    'markdown': {
        'class': 'composer.filters:Markdown',
        'kwargs': {'extras': ['smarty-pants']},
    }
}


index = {
    'filters': filters,
    'routes': routes,
    'static': {'url': '/', 'file': '_static'},
}
print json.dumps(index, indent=4)
