<%inherit file="base.mako"/>

<%block name="title">${route.context['title']} | shazow.net</%block>

<%block name="extra_head">
    <link href="/static/css/pygments.css" media="screen" rel="stylesheet" type="text/css" />
</%block>

<div class="container post">
${body}

% if 'name' in route.context:
    <a class="credits" href="${route.commits_url()}">
        Written by ${route.context.get('name')} on ${route.render_created()}.
        % if 'time_updated' in route.context:
            Updated on ${route.render_updated()}.
        % endif
    </a>
% endif
</div>


<footer>
    <a href="/" rel="author" class="return-home">
        <img title="shazow.net" alt="shazow.net" src="/static/images/turkey_50px.png" />
        <span>shazow.net</span>
    </a>
</footer>
