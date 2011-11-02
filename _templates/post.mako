<%inherit file="base.mako"/>
<%
    import time

    def timestamp_to_html(seconds):
        if not seconds:
            return ''

        t = time.gmtime(float(seconds))
        humane = time.strftime('%b ', t) + time.strftime('%d, ', t).lstrip('0') + time.strftime('%Y', t)
        return '<span data-timestamp="%s" class="timestamp">%s</span>' % (seconds, humane)

    time_created = timestamp_to_html(route.context.get('time_created'))
    time_updated = timestamp_to_html(route.context.get('time_updated'))
%>

<%block name="title">${route.context['title']} | shazow.net</%block>

<%block name="extra_head">
    <link href="/static/css/pygments.css" media="screen" rel="stylesheet" type="text/css" />
</%block>

<div class="container post">
${body}

% if 'name' in route.context:
    <p class="credits">
        <a href="https://github.com/shazow/everything/commits/master/${index.relative_path(route.file, '_everything')}">
            Written by ${route.context.get('name')}${time_created and ' on %s' % time_created}.
            % if time_updated:
                Updated on ${time_updated}.
            % endif
        </a>
    </p>
% endif
</div>


<footer>
    <a href="/" rel="author" class="return-home">
        <img title="shazow.net" alt="shazow.net" src="/static/images/turkey_50px.png" />
        <span>shazow.net</span>
    </a>
</footer>
