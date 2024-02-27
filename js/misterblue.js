// Copyright 2015 Misterblue

// Make an element appear and disappear
// document.click(function() {
//     document.getElementById(".blindtoggle").toggle("blind");
// });

// Fix for hash tags getting covered by the top menu bar
// Ref: https://github.com/twbs/bootstrap/issues/1768
var shiftWindow = function() { scrollBy(0, -50); };
if (location.hash) shiftWindow();
window.addEventListener("hashchange", shiftWindow);
