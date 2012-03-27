// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function showNewListForm(buttonClass, formClass) {
	var linkText = $('.' + buttonClass).html();
	buttonClass = '.' + buttonClass;
	formClass = '.' + formClass;
	$(buttonClass).click(function() {
		if ($(formClass).css('display')  == 'none') {
			$(buttonClass).html('Cancel');
			$(formClass).show();
		}
		else {
			$(buttonClass).html(linkText);
			$(formClass).hide();
		}
	});
}

function showEditForm(buttonClass) {
	var linkText = $('.' + buttonClass).html();
	buttonClass = '.' + buttonClass;
	$(buttonClass).click(function() {
		var segs = this.id.split('-');
		var listID = segs[2];
		formID = '#list-form-' + listID;
		buttonID = '#' + this.id;
		
		if ($(formID).css('display')  == 'none') {
			$(buttonID).html('Cancel');
			$(formID).show();
			$('#list-name-' + listID).hide();
		}
		else {
			$(buttonID).html(linkText);
			$(formID).hide();
			$('#list-name-' + listID).show();
		}
	});
}

$(document).ready(function() {
	
	showNewListForm('new-list-button', 'new-list-form');
	
	showEditForm('edit-list-button');
	
});