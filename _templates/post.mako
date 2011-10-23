<%inherit file="base.mako"/>

<%block name="title">${route.context['title']} | shazow.net</%block>

<%block name="extra_head">
    <link href="/static/css/pygments.css" media="screen" rel="stylesheet" type="text/css" />
</%block>

<div class="container post">
${body}

    <footer>
        <a href="/">shazow.net</a>
    </footer>
</div>
