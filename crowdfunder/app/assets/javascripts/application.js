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
//= require foundation
//= require_tree .

	function paginate(){
	$('.pagination a').on('click',function(e){

		e.preventDefault();
		myUrl = $(this).attr('href');
		$.ajax({
			url: myUrl,
			type: 'get',
			dataType: 'script'
		});

	});
}

$(document).ready(function(){

	$('.contribute-button').on('click',function(e){

		$(this).attr('disabled', 'true')

		e.preventDefault();
		myUrl = $(this).attr('data');
		$.ajax({
			url: myUrl,
			type: 'POST',
			dataType: 'script'
		});

	});

	paginate();




});
$(function(){ $(document).foundation(); });



$(function() {
   $("#new-comment")
      .on('ajax:beforeSend', function() { // set this code to happen just before the ajax request is made
        $("#new-comment input[type='submit']") // make changes to the submit button
          .val('Saving...') // change the text on the button
          .attr('disabled', 'disabled'); // disable the button
      })
      .on('ajax:complete', function() {
        $("#new-comment input[type='submit']")
          .val('Create comment')
          .removeAttr('disabled');
      });
});
