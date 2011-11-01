<%inherit file="base.mako"/>

<%block name="title">${route.context['title']} | shazow.net</%block>

<%block name="extra_head">
    <link href="/static/css/pygments.css" media="screen" rel="stylesheet" type="text/css" />
</%block>

<div class="container post">
${body}
</div>

<a href="/" rel="author" class="return-home">
    <img title="Return to shazow.net" alt="Return to shazow.net" src="/static/images/turkey_50px.png" />
</a>
