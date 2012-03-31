<%inherit file="base.mako"/>

<h1><a href="/">Andrey Petrov</a></h1>

<div class="container">

    <div class="section header">
        <ul class="vertical" style="text-align: center; line-height: 26px;">
            <li>Silicon Valley (California) / Toronto (Ontario)</li>
            <li><span class="email-address"></span></li>
        </ul>
    </div>

    <div class="section identity">
        <h2>I'm shazow on&hellip;</h2>
        <ul class="vertical">
            <li><a rel="me" href="https://github.com/shazow">Github</a> where I reinvent your wheels in less code.</li>
            <li><a rel="me" href="https://www.google.com/profiles/shazow">Google+</a> where I keep refreshing to check for new features.</li>
            <li><a rel="me" href="https://twitter.com/shazow">Twitter</a> where I try to be funny.</li>
            <li><a rel="me" href="https://facebook.com/shazow">Facebook</a> where I'm reminded about how old I am.</li>
        </ul>
    </div>

    <div class="section projects">
        <h2>You should try some things I've built recently like&hellip;</h2>
        <ul class="vertical">
            <li><a href="http://bit.ly/chrome-colorblendy">ColorBlendy</a>  &mdash; Color blending tool so you don't have to open Photoshop to overlay or multiply a couple of colours.</li>
            <li><a href="https://github.com/shazow/composer">Composer</a>  &mdash; Static site generator in Python powering this very site.</li>
            <li><a href="http://bit.ly/linerage-chrome">LineRage</a>  &mdash; Arcade-style game where you're a line and you try not to hit stuff.</li>
            <li><s><a href="http://socialgrapple.com/">SocialGrapple</a></s>  &mdash; Twitter analytics tool that tracks changes in your social graph.</li>
            <li><a href="http://tweepsect.com/">Tweepsect</a>  &mdash; Intersect your Twitter social graph to uncover your stalkers.</li>
            <li><a href="https://github.com/shazow/unstdlib.py">Unstdlib.py</a>  &mdash; Collection of highly reusable Python code.</li>
            <li><a href="http://code.google.com/p/urllib3/">Urllib3</a>  &mdash;  Python HTTP library with thread-safe connection pooling.</li>
        </ul>
    </div>

    <div class="section likes">
        <h2>I've written about&hellip;</h2>
        <ul class="vertical">
        <%
            def _has_tag(route, tag):
                return tag in (route.context or {}).get('tags', [])

            posts = (r for r in index.routes if _has_tag(r, 'post'))
            ordered_posts = sorted(posts, key=lambda o: o.context.get('title'))
        %>
        % for post in ordered_posts:
            <li><a href="${post.url}">${post.context['title']}</a></li>
        % endfor
        </ul>
    </div>

    <div class="section likes">
        <h2>I'm passionate about things like&hellip;</h2>

        <ul class="horizontal">
            <li>Apple Pie</li>
            <li>Bitcoins</li>
            <li>Chess</li>
            <li>Distributed Peer-to-peer</li>
            <li>Everything2</li>
            <li>JavaScript</li>
            <li>Linux</li>
            <li>Massively-multiplayer Games</li>
            <li>Metaverse</li>
            <li>Open Source</li>
            <li>PostgreSQL</li>
            <li>Python</li>
            <li>Science Fiction &amp; Futurism</li>
            <li>Social Psychology</li>
            <li>Stickfigures</li>
            <li>Web Technology</li>
        </ul>
    </div>

    <div class="section more">
        <p>
            You can learn more about me by reading <a href="http://bit.ly/shazow_resume">my résumé</a> or <a href="http://www.google.com/search?q=shazow">googling me</a>.
        </p>
    </div>

    <a href="https://github.com/shazow/shazow.net">
        <img style="position: absolute; top: 0; right: 0; border: 0;"
             src="https://a248.e.akamai.net/assets.github.com/img/7afbc8b248c68eb468279e8c17986ad46549fb71/687474703a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67"
             alt="Fork me on GitHub" />
    </a>

<%block name="tail">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>!window.jQuery && document.write(unescape('%3Cscript src="/static/js/libs/jquery.min.js"%3E%3C/script%3E'))</script>

<script src="/static/js/email.js"></script>
</%block>
