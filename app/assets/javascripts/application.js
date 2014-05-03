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
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function elide(id) {
	var e = document.getElementById(id);
	if(e.style.height == '0px') {
   		e.style.height = '';
   	} else {
		e.style.height = '0px';
   	}
}

function toggle_plus(id) {
	var e = document.getElementById(id);
	if (e.className.match(/plus/))
		e.className = e.className.replace(/plus/, "minus");
	else
		e.className = e.className.replace(/minus/, "plus");
}
