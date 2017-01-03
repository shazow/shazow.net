<%inherit file="base.mako"/>

<%block name="extra_head">
<meta property="twitter:account_id" content="796601" />
</%block>

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
            <li class="tag service"><a href="http://briefmetrics.com/">briefmetrics</a>  &middot; Remove the pain of using Google Analytics with weekly email summaries.</li>
            <li class="tag service"><a href="http://bit.ly/chrome-colorblendy">colorblendy</a>  &middot; Color blending tool so you don't have to open Photoshop to overlay or multiply a couple of colours.</li>
            <li class="tag code"><a href="https://github.com/shazow/composer">composer</a>  &middot; Static site generator in Python powering this very site.</li>
            <li class="tag code"><a href="github.com/shazow/go-selfcompile">go-selfcompile</a>  &middot; Prototype for building self-recompiling Go binaries.</li>
            <li class="tag code"><a href="https://github.com/shazow/gameblocks.js">gameblocks.js</a>  &middot; Toolkit for making games in JavaScript.</li>
            <li class="tag game"><a href="http://bit.ly/linerage-chrome">linerage</a>  &middot; Arcade-style game where you're a line and you try not to hit stuff.</li>
            <li class="tag code"><a href="https://github.com/shazow/ssh-chat">ssh-chat</a>  &middot; Chat over SSH.</li>
            <li class="tag service"><s><a href="https://www.google.com/search?q=socialgrapple">socialgrapple</a></s>  &middot; Twitter analytics tool that tracks changes in your social graph. <span class="tag acquired"></span></li>
            <li class="tag service"><a href="http://tweepsect.com/">tweepsect</a>  &middot; Intersect your Twitter social graph to uncover your stalkers.</li>
            <li class="tag code"><a href="https://github.com/shazow/unstdlib.py">unstdlib.py</a>  &middot; Collection of highly reusable Python code.</li>
            <li class="tag code"><a href="https://github.com/shazow/urllib3">urllib3</a>  &middot;  Python HTTP library with thread-safe connection pooling.</li>
            <li class="tag service"><s><a href="http://wedomainsearch.com/">wedomainsearch</a></s>  &middot; Find available domains with friends. <span class="tag acquired"></li>
        </ul>
    </div>

    <div class="section writing">
        <h2>I've written about&hellip;</h2>
        <ul class="vertical">
            <li class="offsite heroku"><a href="https://blog.heroku.com/see_python_see_python_go_go_python_go">See Python, See Python Go, Go Python Go</a> (Also <a href="https://www.youtube.com/watch?v=CkDwb5koRTc">gave this talk at PyCon 2016</a>)</li>
            <li class="offsite medium"><a href="https://medium.com/mobile-lifestyle/in-vr-would-a-rose-smell-sweeter-8d7e876bfa51">In VR, Would a Rose Smell Sweeter?</a></li>
            <li class="offsite medium"><a href="https://medium.com/@shazow/how-i-design-json-api-responses-71900f00f2db">How I design JSON API responses</a></li>
            <li class="offsite medium"><a href="https://medium.com/@shazow/ssh-how-does-it-even-9e43586e4ffc">Why aren’t we using SSH for everything?</a></li>
            <li class="offsite medium"><a href="https://medium.com/@shazow/urllib3-stripe-and-open-source-grants-edb9c0e46e82">Urllib3, Stripe, and Open Source Grants</a></li>
            <li class="offsite medium"><a href="https://medium.com/@shazow/what-is-your-fantasy-c88bed381f4d">What is your fantasy?</a></li>
            <li class="offsite medium"><a href="https://medium.com/open-source/how-to-maintain-a-successful-open-source-project-aaa2a5437d3a">How to maintain a successful open source project</a></li>
            <%
                posts = (r for r in index.routes if 'post' in (r.context or {}).get('tags', []))
                posts = sorted(posts, key=lambda r: r.context.get('time_created'), reverse=True)
            %>
            % for post in posts:
                <li><a href="${post.url}">${post.context['title']}</a></li>
            % endfor
        </ul>
    </div>

    <div class="section likes">
        <h2>I'm passionate about things like&hellip;</h2>

        <ul class="horizontal">
            <li>Apple Pie</li>
            <li>Chess</li>
            <li>Cryptocurrency</li>
            <li>Distributed Peer-to-peer</li>
            <li>Everything2</li>
            <li>Golang</li>
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
            <li>Virtual Reality</li>
            <li>Web Technology</li>
        </ul>
    </div>

    <div class="section more">
        <p>
            You can learn more about me by reading <a href="http://bit.ly/shazow_resume">my outdated résumé</a> or <a href="http://www.google.com/search?q=shazow">googling me</a>.
        </p>
    </div>

    <a href="https://github.com/shazow/shazow.net">
        <img style="position: absolute; top: 0; right: 0; border: 0;"
             src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"
             alt="Fork me on GitHub" />
    </a>

</div>

<%block name="tail">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>!window.jQuery && document.write(unescape('%3Cscript src="/static/js/libs/jquery.min.js"%3E%3C/script%3E'))</script>

<script src="/static/js/email.js"></script>
</%block>
