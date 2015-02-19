//= require tinymce

if( typeof jQuery != 'undefined')
{
	$(document).on('page:receive',function(){
		tinymce.remove();
	});
	$(document).ready(function(){
		tinyMCE.init({
		selector: "textarea.tinymce"
		});
	});
}
else
{
	document.addEventListener("DOMContentLoaded", function(event) {
		tinyMCE.init({
		selector: "textarea.tinymce"
		});
	});
}
