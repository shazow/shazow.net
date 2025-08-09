document.addEventListener('DOMContentLoaded', function() {
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
        const footnotes = post.querySelector('.footnotes');
        if (!footnotes) return;

        const sidenotes = document.createElement("ol");
        sidenotes.className = "sidenotes";
        post.appendChild(sidenotes);

        footnotes.querySelectorAll("li").forEach((footnote) => {
            // <a href="#fnref:1" class="footnote-backref" role="doc-backlink">↩︎</a>
            const backref = footnote.querySelector('.footnote-backref').getAttribute("href");

            // <sup id="fnref:1"><a ...>1</a></sup>
            const sup = document.getElementById(backref.slice(1));

            if (!sup) return;

            const sidenote = footnote.cloneNode(true);
            sidenotes.appendChild(sidenote);

            // Use a minimal timeout to ensure the browser has rendered the new element
            // and its offsetTop is readable.
            setTimeout(() => {
                const targetTop = sup.offsetTop;
                const currentTop = sidenote.offsetTop;

                if (currentTop < targetTop) {
                    sidenote.style.marginTop = (targetTop - currentTop) + "px";
                }
            }, 0);
        });
    });
});
