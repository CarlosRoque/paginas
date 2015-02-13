//= require tinymce

if( typeof jQuery != 'undefined')
{
	$(document).on('page:receive',function(){tinymce.remove()});
}