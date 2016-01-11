class EmployeesController < ApplicationController
	def index
		@employees_active = Employee.active.sort_by_type.sort_name
		@employees_inactive = Employee.inactive.sort_by_type.sort_name
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
    # Save the object
    if @employee.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Employee created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
	end

	private

  def employee_params
    # same as using "params[:appointment]", except that it:
    # - raises an error if :appointment is not present
    # - allows listed attributes to be mass-assigned
    params.require(:employee).permit(:type,:first_name,:last_name,:email,:password,:phone_number,:status,:wage)
  end

end
