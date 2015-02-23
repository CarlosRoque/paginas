//= require tinymce

if( typeof jQuery != 'undefined')
{
	$(document).on('page:receive',function(){

	});
	$(document).ready(function(){
		tinymce.remove();
		tinyMCE.init({
		selector: "textarea.tinymce"
		});
	});
}
else
{
	document.addEventListener("DOMContentLoaded", function(event) {
		tinymce.remove();
		tinyMCE.init({
		selector: "textarea.tinymce"
		});
	});
}
