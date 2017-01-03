<%inherit file="base.mako"/>

<div class="container hireme">
    <h2>Let's work together</h2>

    <p>
        Hi, I'm Andrey. (Or, <a href="https://shazow.net/">shazow</a> on <a href="https://www.youtube.com/watch?v=6WpMlwVwydo">the internet</a>.)
    </p>
    <p>
        I build successful open source projects, work on my own products, and occasionally work on a contract basis with tech companies.
    </p>
    <p>
        <strong>I'm excited about writing open source Go code.</strong> Can I help your company? <span>(<a href="#help-with" class="reveal">Other things I can do for you</a>.)</span>
    </p>

    <section id="help-with" class="hidden">
        <h3>Help with:</h3>
        <ul>
            <li>
                <strong>Open Source</strong><br />
                My open source projects have accepted contributions from hundreds of people. Utilize my experience to launch, structure, or revamp your company's open source efforts.
                (Examples: <a href="https://github.com/shazow/urllib3">urllib3</a>, <a href="https://github.com/shazow/ssh-chat">ssh-chat</a>)
            </li>
            <li>
                <strong>R&amp;D and Prototyping</strong><br />
                Are you considering a risky unproven technology, but want a working proof of concept before committing resources? These are some of my favorite projects.
                (Examples: <a href="https://github.com/shazow/go-selfcompile">go-selfcompile</a>, <a href="https://github.com/shazow/gohttplib">gohttplib</a>, <a href="https://github.com/shazow/go-git">go-git</a>)
            </li>
            <li>
                <strong>Stand-Alone Applications and Services</strong><br />
                Is there a pain point in your business that can be fixed by a one-off application or service? These kinds of tasks are perfect for outsourcing.
            </li>
            <li>
                <strong>Infrastructure and Deployment</strong> (docker, service discovery, instrumentation)
            </li>
            <li>
                <strong>Database Scalability</strong> (schema redesign, migration, query optimization, sharding)
            </li>
            <li>
                <strong>Analytics</strong> (instrumentation, analysis)
            </li>
        </ul>
    </section>

    <section>
        <h3>I've worked with:</h3>
        <ul class="horizontal">
            <li><a href="https://sourcegraph.com/">Sourcegraph</a></li>
            <li><a href="https://gliderlabs.com/">Glider Labs</a></li>
            <li><a href="https://mirror.co/">Mirror</a></li>
            <li><a href="https://www.runscope.com/">Runscope</a></li>
            <li><a href="https://www.sequoiacap.com">Sequoia</a></li>
            <li><a href="https://google.com/">Google</a></li>
            <li><a href="https://docker.com/">Docker</a></li>
            <li><a href="https://www.pinterest.com/">Pinterest</a></li>
            <li><a href="https://tineye.com/">TinEye</a></li>
        </ul>
    </section>

    <section>
        <h3>Reaching out</h3>

        <p>
            I can only consider budgets starting at $5,000. Initial consultation is completely free. I have to turn down projects that aren’t a good fit for me and you—I’ll be upfront!
        </p>

        <p>
            It's a good idea to take a look at <a href="https://github.com/shazow">my previous work</a> which will give you an idea of my areas of expertise.
        </p>

        <h4>Checklist for reaching out (so I can get back to you quickly)</h3>
        <ul>
            <li>Budget</li>
            <li>Timeline/Urgency</li>
            <li>Technology stack</li>
            <li>Problem</li>
            <li>Any previous solutions</li>
        </ul>

        <p>Tell me how I can help you at <a href="mailto:andrey.petrov@shazow.net">andrey.petrov@shazow.net</a>.</p>
    </section>

    <section>
        <h3>More about me</h3>
        <ul>
            <li><a href="https://shazow.net">shazow.net</a></li>
            <li><a href="https://github.com/shazow">github.com/shazow</a></li>
            <li><a href="https://twitter.com/shazow">twitter.com/shazow</a></li>
        </ul>
    </section>
</div>

<%block name="tail">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>!window.jQuery && document.write(unescape('%3Cscript src="/static/js/libs/jquery.min.js"%3E%3C/script%3E'))</script>
<script type="text/javascript">
    $(function() {
        $(".reveal").click(function() {
            var href = $(this).attr('href');
            if (href[0] != '#') return true;
            var q = $(href).animate({opacity: "toggle"});
            return q.length == 0; // false is succeeded
        });
    });
</script>
</%block>
