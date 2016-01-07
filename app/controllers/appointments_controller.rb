class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.sort_by_time
	end
end
