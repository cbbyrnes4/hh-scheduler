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
      flash[:success] = "Employee created successfully."
      redirect_to(employees_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
	end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @employee = Employee.find(params[:id])
    # Update the object
    if @employee.update_attributes(employee_params)
      # If update succeeds, redirect to the index action
      flash[:success] = "Employee updated successfully."
      redirect_to(employee_path(@employee.id))
    else
      # If update fails, redisplay the form so user can fix it
      render('edit')
    end
  end

  def delete
    @employee = Employee.find(params[:id])
  end

  def destroy
    employee = Employee.find(params[:id]).destroy
    flash[:success] = "Employee #{employee.id} (#{employee.name}) destroyed successfully"
    redirect_to(employees_path)
  end

	private

  def employee_params
    # same as using "params[:appointment]", except that it:
    # - raises an error if :appointment is not present
    # - allows listed attributes to be mass-assigned
    params.require(:employee).permit(:type,:first_name,:last_name,:email,:password,:phone_number,:status,:wage)
  end

end
