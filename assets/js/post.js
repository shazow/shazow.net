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

        // Track the sups in the respective idx so we can restack against them later
        const sups = [];

        post.querySelectorAll(".footnotes li").forEach((footnote) => {
            // <a href="#fnref:1" class="footnote-backref" role="doc-backlink">↩︎</a>
            const backref = footnote.querySelector('.footnote-backref').getAttribute("href");

            // <sup id="fnref:1"><a ...>1</a></sup>
            const sup = document.getElementById(backref.slice(1));
            sups.push(sup);

            const sidenote = footnote.cloneNode(true);
            sidenotes.appendChild(sidenote);
        });

        if (!sidenotes.hasChildNodes()) return;

        function restack() {
            // Stack notes vertically as long as the top position is at least the position of the sup link.
            let lastOffset = 0;
            sidenotes.childNodes.forEach((sidenote, idx) => {
                const top = Math.max(sups[idx].offsetTop, lastOffset);
                sidenote.style.top = top + "px";
                lastOffset = top + sidenote.getBoundingClientRect().height;
            });
        };
        restack();

        // Apply restacking on resize, once every 200ms
        let debounce;
        window.addEventListener('resize', () => {
            clearTimeout(debounce);
            debounce = setTimeout(restack, 200);
        });
    })
})()
