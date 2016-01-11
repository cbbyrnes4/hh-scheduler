class AppointmentsController < ApplicationController
	def index
		@appointments_active = Appointment.active.sort_by_time
    @appointments_inactive = Appointment.inactive.sort_by_time
	end

	def new
		@appointment = Appointment.new
	end

	def create
		@appointment = Appointment.new(appointment_params)
    # Save the object
    if @appointment.save
      # If save succeeds, redirect to the index action
      flash[:success] = "Appointment created successfully."
      redirect_to(appointments_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
	end

  def show
    @appointment = Appointment.find(params[:id]) 
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @appointment = Appointment.find(params[:id])
    # Update the object
    if @appointment.update_attributes(appointment_params)
      # If update succeeds, redirect to the index action
      flash[:success] = "Appointment updated successfully."
      redirect_to(appointment_path(@appointment.id))
    else
      # If update fails, redisplay the form so user can fix it
      render('edit')
    end
  end

  def delete
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    appointment = Appointment.find(params[:id]).destroy
    flash[:success] = "Appointment #{appointment.id} for #{appointment.name} destroyed successfully"
    redirect_to(appointments_path)
  end

	private

  def appointment_params
    # same as using "params[:appointment]", except that it:
    # - raises an error if :appointment is not present
    # - allows listed attributes to be mass-assigned
    params.require(:appointment).permit(:customer_first_name,:customer_last_name,:street_address,:city,:state,:zip,:type,:status,:job_size,:estimated_time,:actual_time,:datetime,:notes,:email,:phone_number)
  end
end
