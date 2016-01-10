class EmployeesController < ApplicationController
	def index
		@employees_active = Employee.active.sort_by_type.sort_name
		@employees_inactive = Employee.inactive.sort_by_type.sort_name
	end
end
