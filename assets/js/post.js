(function() {
    document.querySelectorAll("article.post").forEach((post) => {
        // Add anchor link to headers
        post.querySelectorAll('h2[id], h3[id], h4[id]').forEach((header) => {
            const anchor = document.createElement('a');
            anchor.className = 'header-anchor';
            anchor.href = '#' + header.id;
            anchor.innerHTML = '#';
            header.prepend(anchor);
        });

        // Add sidenotes to each post
        const sidenotes = document.createElement("ol");
        sidenotes.className = "sidenotes"
        post.appendChild(sidenotes);

        let lastOffset = 0;
        post.querySelectorAll(".footnotes li").forEach((footnote) => {
            // <a href="#fnref:1" class="footnote-backref" role="doc-backlink">↩︎</a>
            const backref = footnote.getElementsByClassName('footnote-backref')[0].getAttribute("href");

            // <sup id="fnref:1"><a ...>1</a></sup>
            const sup = document.getElementById(backref.slice(1));

            // Stack notes vertically as long as the top position is at least the position of the sup link.
            const sidenote = footnote.cloneNode(true);
            sidenotes.appendChild(sidenote);
            const top = Math.max(sup.offsetTop, lastOffset);
            sidenote.style.top = top + "px";
            lastOffset = top + sidenote.getBoundingClientRect().height;
        });
    })
})()
