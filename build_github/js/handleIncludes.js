
/*
Example: absoluteUrl("../subfolder1/divaspari/", "../images/forest-fire.jpg") == "../subfolder1/images/forest-fire.jpg"
 */
function absoluteUrl(base, relative) {
    // console.debug(base, relative);
    if (relative.startsWith("http") || relative.startsWith("file")) {
        return relative;
    }
    if (relative.startsWith("/") && !base.startsWith("http") && !base.startsWith("file")) {
        return relative;
    }
    var stack = base.toString().split("#")[0].split("/"),
        parts = relative.split("/");
    stack.pop(); // remove current file name (or empty string)
                 // (omit if "base" is the current folder without trailing slash)
    for (var i=0; i<parts.length; i++) {
        if (parts[i] == ".")
            continue;
        if (parts[i] == "..")
            stack.pop();
        else
            stack.push(parts[i]);
    }
    return stack.join("/");
}

// WHen you include html from one page within another, you need to fix image urls, anchor urls etc..
function fixIncludedHtml(url, html, newLevelForH1) {
    // We want to use jquery to parse html, but without loading images. Hence this.
    // Tip from: https://stackoverflow.com/questions/15113910/jquery-parse-html-without-loading-images
    var virtualDocument = document.implementation.createHTMLDocument('virtual');

    // The surrounding divs are eliminated when the jqueryElement is created.
    var jqueryElement = $(setInlineComments(`<div>${html}</div>`), virtualDocument);

    // console.debug(jqueryElement.html());
    // Remove some tags.
    jqueryElement.find("script").remove();
    jqueryElement.find("footer").remove();
    jqueryElement.find("#disqus_thread").remove();
    jqueryElement.find("#toc").remove();
    jqueryElement.find("#toc_header").remove();
    jqueryElement.find(".back-to-top").remove();

    jqueryElement.find('.js_include').each(function() {
        // The url which we get here is warped by the calling function, which includes an extra ../ in the beginning. Further, xyz.md files get the terminal "xyz/index.html". Both of these must be undone to make the include element url attribute sane. 
        $(this).attr("url", absoluteUrl(url.replace(/^\.\.\//, "").replace("/index.html", ".md"), $(this).attr("url")));
        if (newLevelForH1 < 1) {
            console.error("Ignoring invalid newLevelForH1: %d, using 6", newLevelForH1);
            newLevelForH1 = 6;
        }
        var includedPageNewLevelForH2 = parseInt($(this).attr("newLevelForH1"));
        if (includedPageNewLevelForH2 == undefined) {
            includedPageNewLevelForH2 = 6;
        }
        includedPageNewLevelForH2 = Math.min(6, ((includedPageNewLevelForH2 - 2) + newLevelForH1));
        $(this).attr("newLevelForH1", includedPageNewLevelForH2);
    });


    /*
    Fix headers in the included html so as to not mess up the table of contents
    of the including page.
    Adjusting the heading levels to retain substructure seems more complicated -
    getting the heading "under" which jsIncludeJqueryElement falls seems non-trivial.
     */
    var headers = jqueryElement.find(":header");
    if (headers.length > 0) {
        var id_prefix = url.replace("/", "_");
        headers.replaceWith(function() {
            var headerElement = $(this);
            // console.debug(headerElement);
            var hLevel = parseInt(headerElement.prop("tagName").substring(1));
            var hLevelNew = Math.min(6, newLevelForH1 - 1 + hLevel);
            var newId = id_prefix + "_" + headerElement[0].id;
            return $("<h" + hLevelNew +" id='" + newId + "'/>").append(headerElement.contents());
        });
    }


    // Fix image urls.
    jqueryElement.find("img").each(function() {
        // console.log(absoluteUrl(url, $(this).attr("src")));
        // console.log($(this).attr("src"))
        $(this).attr("src", absoluteUrl(url, $(this).attr("src")));
        // console.log($(this).attr("src"))
    });

    // Fix links.
    jqueryElement.find("a").each(function() {
        // console.debug($(this).html());
        var href = $(this).attr("href");
        if (href.startsWith("#")) {
            var headers = jqueryElement.find(":header");
            var new_href = href;
            if (headers.length > 0) {
                var id_prefix = headers[0].id;
                new_href = id_prefix + "_" + href.substr(1);
                // console.debug(new_href, id_prefix, href);
                jqueryElement.find(href).each(function () {
                    $(this).attr("id", new_href.substr(1));
                });
            }
            $(this).attr("href", new_href);
        } else {
            $(this).attr("href", absoluteUrl(url, href));
        }
    });

    return jqueryElement.html();
}

// An async function returns results wrapped in Promise objects.
async function processAjaxResponseHtml(responseHtml, addTitle, includedPageNewLevelForH1, includedPageUrl) {
    // We want to use jquery to parse html, but without loading images. Hence this.
    // Tip from: https://stackoverflow.com/questions/15113910/jquery-parse-html-without-loading-images
    var virtualDocument = document.implementation.createHTMLDocument('virtual');

    var titleElements = $(responseHtml, virtualDocument).find("h1");
    var title = "";
    if (titleElements.length > 0) {
        // console.debug(titleElements[0]);
        title = titleElements[0].textContent;
    }

    var contentElements = $(responseHtml, virtualDocument).find("#post_content");
    // console.log(contentElements);
    if (contentElements.length == 0) {
        let message = "Could not get \"post-content\" class element.";
        console.warn(message);
        console.log(responseHtml);
        throw Error(message);
    } else {
        // We don't want multiple post-content divs, hence we replace with an included-post-content div.
        var editLinkElements = $(responseHtml, virtualDocument).find("#editLink");
        var editLinkHtml = "";
        if (editLinkElements.length > 0) {
            // console.debug(editLinkElements);
            editLinkHtml = `<a class="btn btn-secondary" href="${editLinkElements.attr("href")}"><i class="fas fa-edit"></i></a>`
        }
        var titleHtml = "";
        if (addTitle) {
            titleHtml = "<div class='border d-flex justify-content-between'>" +
                "<h1 id='" + title + "'>" + title + "</h1>" +
                "<div><a class='btn btn-secondary' href='" + absoluteUrl(document.location, includedPageUrl) + "'><i class=\"fas fa-external-link-square-alt\"></i></a>" +
                editLinkHtml + "</div>" +
                "</div>";
        }
        var contentHtml = `<div class=''>${contentElements[0].innerHTML}</div>`;
        var elementToInclude = $("<div class='included-post-content border'/>")
        elementToInclude.html(fixIncludedHtml(includedPageUrl, titleHtml, includedPageNewLevelForH1) + fixIncludedHtml(includedPageUrl, contentHtml, includedPageNewLevelForH1));
        return elementToInclude;
    }
}

async function fillJsInclude(jsIncludeJqueryElement, includedPageNewLevelForH1) {
    if (jsIncludeJqueryElement.html().trim() != "") {
        console.warn("Refusing to refill element with non-empty html - ", jsIncludeJqueryElement);
        return "Already loaded";
    }
    console.info("Inserting include for ", jsIncludeJqueryElement);
    var includedPageUrl = "../" + jsIncludeJqueryElement.attr("url").replace(".md", "/").toLowerCase();
    if (includedPageUrl.endsWith("/")) {
        // In case one loads file://x/y/z/ , the following is needed. 
        includedPageUrl = includedPageUrl + "index.html";
    }
    if (includedPageNewLevelForH1 == undefined) {
        includedPageNewLevelForH1 = parseInt(jsIncludeJqueryElement.attr("newLevelForH1"));
    }
    if (includedPageNewLevelForH1 == undefined) {
        includedPageNewLevelForH1 = 6;
    }
    let getAjaxResponsePromise = $.ajax(includedPageUrl);
    function processingFn(responseHtml) {
        return processAjaxResponseHtml(responseHtml, jsIncludeJqueryElement.attr("includeTitle"), includedPageNewLevelForH1, includedPageUrl);
    }
    return getAjaxResponsePromise.then(processingFn).then(function(contentElement) {
        // console.log(contentElement);
        jsIncludeJqueryElement.html(contentElement);
        // The below did not work - second level includes did not resolve.
        let secondLevelIncludes = jsIncludeJqueryElement.find('.js_include');
        if (secondLevelIncludes.length > 0) {
            return Promise.all(secondLevelIncludes.map(function () {
                console.debug("Secondary include: ", $(this));
                return fillJsInclude($(this));
            })).then(function () {
                return jsIncludeJqueryElement;
            });
        } else {
            return jsIncludeJqueryElement;
        }
    }).catch(function(error){
        var titleHtml = "";
        var title = "Missing page.";
        if (jsIncludeJqueryElement.attr("includeTitle")) {
            titleHtml = "<h1 id='" + title + "'>" + title + "</h1>";
        }
        var elementToInclude = titleHtml + "Could not get: " + includedPageUrl + " See debug messages in console for details.";
        fixIncludedHtml(includedPageUrl, elementToInclude, includedPageNewLevelForH1);
        jsIncludeJqueryElement.html(elementToInclude);
        console.warn("An error!", error);
        return jsIncludeJqueryElement;
    });
}

// Process includes of the form:
// <div class="js_include" url="index.md"/>
// can't easily use a worker - workers cannot access DOM (workaround: pass strings back and forth), cannot access jquery library.
function handleIncludes() {
    if ($('.js_include').length == 0 ) { return; }
    return Promise.all($('.js_include').map(function() {
        var jsIncludeJqueryElement = $(this);
        // The actual filling happens in a separate thread!
        return fillJsInclude(jsIncludeJqueryElement);
    }))
        .then(function(values) {
            console.log("Done including.", values);
            // The below lines do not having any effect if not called without the timeout.
            setTimeout(function(){
                setInlineCommentsInPostContent();
                fillAudioEmbeds();
                fillVideoEmbeds();
                updateToc();
            }, 5000);
            return values;
        });
}
