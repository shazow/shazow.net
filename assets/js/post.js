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

        function reflow() {
            // Sidenote vertical positioning is subjective to where the sup link is, so we need to handle reflowing on resize.
            console.log("restacking");
            let lastOffset = 0;
            sidenotes.childNodes.forEach((sidenote, idx) => {
                const top = Math.max(sups[idx].offsetTop, lastOffset);
                sidenote.style.top = top + "px";
                lastOffset = top + sidenote.getBoundingClientRect().height;
            });
        };
        reflow();

        // Apply restacking on resize, twice every 250ms (start and end of the debounce)
        // Once before the debounce makes most resizes feel much more responsive without spamming much, while avoiding a missed reflow at the end.
        let debounce;
        window.addEventListener('resize', () => {
            if (debounce) return;
            reflow();
            debounce = setTimeout(() => {
                debounce = undefined;
                reflow();
            }, 250);
        });
    })
})()
