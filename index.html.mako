<%inherit file="_templates/base.mako"/>

<div class="container">

    <ul class="vertical spaced bio-header" style="text-align: center;">
        <li>Silicon Valley (California) / Toronto (Ontario)</li>
        <li><span class="email-address"></span></li>
    </ul>

    <div class="section identity">
        <ul class="horizontal slots">
            <li>I'm shazow on</li>
            <li><a href="https://github.com/shazow">Github</a></li>
            <li><a href="https://www.google.com/profiles/shazow">Google+</a></li>
            <li><a href="https://twitter.com/shazow">Twitter</a></li>
            <li><a href="https://facebook.com/shazow">Facebook</a></li>
        </ul>
    </div>

    <div class="section projects">
        <ul class="horizontal slots">
            <li>You should try some things I've built like</li>
            <li><a href="http://socialgrapple.com/">SocialGrapple</a></li>
            <li><a href="http://bit.ly/chrome-colorblendy">ColorBlendy</a></li>
            <li><a href="http://bit.ly/linerage-chrome">LineRage</a></li>
            <li><a href="http://code.google.com/p/urllib3/">urllib3</a></li>
            <li><a href="https://github.com/shazow/unstdlib.py">unstdlib.py</a></li>
        </ul>
    </div>
</div>

<%block name="tail">
<script src="${bf.config.site.absolute_prefix}/static/js/email.js"></script>
</%block>
