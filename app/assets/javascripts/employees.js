// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:load', function() {
	$('#showUnconfirmed').click(function() {
  		$('#unconfirmedEmployees').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show Unconfirmed Employees') ? 'Hide Unconfirmed Employees' : 'Show Unconfirmed Employees');
	});

	$('#showInactive').click(function() {
  		$('#inactiveEmployees').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show Inactive Employees') ? 'Hide Inactive Employees' : 'Show Inactive Employees');
	});
});