"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    oni.input.unbind("<F2>");
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    "editor.completions.mode": "native",
    // "editor.fullScreenOnStart": true,
    "browser.defaultUrl": "https://www.google.com",
    // "ui.colorscheme": "dracula",
    // "oni.useDefaultConfig": true,
    "oni.bookmarks": ["~/workspace"],
    "oni.loadInitVim": true,
    "editor.fontSize": "14px",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "oni.hideMenu": true,
    "tabs.mode": "native",
    "tabs.showFileIcon": true
};
