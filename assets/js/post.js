(function() {
    // Add sidenotes to each post
    document.querySelectorAll("article.post").forEach((post) => {
        const sidenotes = document.createElement("ol");
        sidenotes.className = "sidenotes"
        post.appendChild(sidenotes);

        document.querySelectorAll(".footnotes li").forEach((footnote) => {
            // <a href="#fnref:1" class="footnote-backref" role="doc-backlink">↩︎</a>
            const backref = footnote.getElementsByClassName('footnote-backref')[0].getAttribute("href");

            // <sup id="fnref:1"><a ...>1</a></sup>
            const sup = document.getElementById(backref.slice(1));

            // Convert to sidenote
            const sidenote = footnote.cloneNode(true);
            sidenotes.appendChild(sidenote);
            sidenote.style.top = sup.offsetTop + "px";
        });
    })
})()
