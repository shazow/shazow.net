<%inherit file="base.mako"/>

<%block name="title">${route.context['title']} | shazow.net</%block>

<%block name="extra_head">
    <link href="/static/css/pygments.css" media="screen" rel="stylesheet" type="text/css" />
</%block>

<div class="container post">
${body}
</div>


<footer>
    <a href="/" rel="author" class="return-home">
        <img title="shazow.net" alt="shazow.net" src="/static/images/turkey_50px.png" />
        <span>shazow.net</span>
    </a>
</footer>
