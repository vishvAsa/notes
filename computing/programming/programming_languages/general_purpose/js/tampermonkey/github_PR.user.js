// ==UserScript==
// @name         GitHub PR CSS Override
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Override code font styles on GitHub PR pages
// @match        https://github.com/*/pull/*
// @grant        GM_addStyle
// ==/UserScript==

(function() {
    'use strict';

    // Inject custom CSS
    GM_addStyle(`
        textarea, code, .markdown-body, .blob-code-inner {
            font-family: var(--fontStack-), monospace !important;
            font-size: 25px !important;
            line-height: 1.5 !important;
        }
    `);
})();
