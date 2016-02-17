// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

if (window.console == null) {
	window.console = {};
}

if (window.console.log == null) {
	window.console.log = function(){};
}

$(function(){
	var theForm = $('#new_comment');
	theForm.attr('action', '/comments');
	theForm.submit(function(event) {
		var text = $('#comment_content').val()
		if (text.indexOf("http://") == -1 && text.indexOf("https://") == -1) {
			return true;
		}
		console.log("спамишь, сука!")
		event.preventDefault();
		return false;
	});
});
