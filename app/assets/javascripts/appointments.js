// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initialize() {
	$('#showComplete').click(function() {
  		$('#completeAppointments').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show Completed Appointments') ? 'Hide Completed Appointments' : 'Show Completed Appointments');
	});
}
$(document).ready(initialize);
$(document).on('page:restore',initialize);