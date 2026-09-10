// ==UserScript==
// @name         Messaging font override
// @namespace    http://tampermonkey.net/
// @version      2026-04-15
// @description  Override message font size and line height
// @author       You
// @match        https://web.telegram.org/*
// @match        https://web.whatsapp.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=telegram.org
// @icon         https://www.google.com/s2/favicons?sz=64&domain=whatsapp.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const style = document.createElement('style');
    style.textContent = `
        .message, .copyable-text {
            font-size: 25px !important;
            line-height: 1.5 !important;
        }
    `;
    document.head.appendChild(style);
})();
