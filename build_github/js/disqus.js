/**
 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

var disqus_config = function () {
this.page.url = pageUrl;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = pageSource; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};

function setupDisqus() { // DON'T EDIT BELOW THIS LINE
    let disqusShortname = siteParams["disqusShortname"];
    if (!disqusShortname) {
        return;
    }
    var d = document, s = d.createElement('script');
    s.src = `https://${disqusShortname}.disqus.com/embed.js`;
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
}
