// ==UserScript==
// @name         Devanagari Font Enlarger for X.com
// @namespace    http://tampermonkey.net/
// @version      1.4
// @description  Enlarge Devanagari text in tweets on X.com
// @author       Vishvas
// @match        https://x.com/*
// @match        https://twitter.com/*
// @grant        GM_addStyle
// ==/UserScript==

(function() {
    'use strict';

    GM_addStyle(`
        /* Target tweet text containers with language attribute */
        div[lang][lang="mr"],
        div[lang][lang="hi"],
        div[lang][lang="sa"],
        div[lang][lang="ne"] {
            font-size: 25px !important;
            line-height: 1.6 !important;
            font-family: 'Noto Sans Devanagari','Tiro Devanagari',sans-serif !important;
        }
    `);
})();
