/*global define:false */

// This is simply here to test requireJS.
// There are much better ways to get the width of an element.
// DO NOT USE THIS CODE IN PRODUCTION

define(['jquery'], function ($) {
    'use strict';
    $.fn.logWidth = function (options) {
        return this.each(function () {
            console.log('Plugin test', $(this).width());
        });
    };
});