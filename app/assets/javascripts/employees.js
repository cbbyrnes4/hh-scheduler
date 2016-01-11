// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initialize() {
	$('#showUnconfirmed').click(function() {
  		$('#unconfirmedEmployees').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show unconfirmed employees') ? 'Hide unconfirmed employees' : 'Show unconfirmed employees');
	});

	$('#showInactive').click(function() {
  		$('#inactiveEmployees').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show inactive employees') ? 'Hide inactive employees' : 'Show inactive employees');
	});
}

$(document).ready(initialize);
$(document).on('page:restore',initialize);