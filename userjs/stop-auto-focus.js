// ==UserScript==
// @description	-	Prevents focusing of input/textarea elements on page load
// @author		-	Ayush
// ==/UserScript==

(function(focusFunc, opera){
	HTMLInputElement.prototype.focus=HTMLTextAreaElement.prototype.focus=function(){};
	(opera||window).addEventListener(
		opera?'AfterEvent.load':'load',
		function(){setTimeout(function(){HTMLInputElement.prototype.focus=HTMLTextAreaElement.prototype.focus=focusFunc},1000)},
		false
	);
})(HTMLInputElement.prototype.focus, window.opera)