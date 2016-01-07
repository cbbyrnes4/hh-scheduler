class AddIndexToAppointmentsEmployeesTable < ActiveRecord::Migration
  def change
  	add_index :appointments_employees, ["appointment_id", "employee_id"]
  end
end
