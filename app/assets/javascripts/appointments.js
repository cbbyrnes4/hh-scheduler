// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initialize() {
	$('#showComplete').click(function() {
  		$('#completeAppointments').toggleClass('hidden');
  		$(this).html(($(this).text() == 'Show inactive appointments') ? 'Hide inactive appointments' : 'Show inactive appointments');
	});
}
$(document).ready(initialize);
$(document).on('page:restore',initialize);