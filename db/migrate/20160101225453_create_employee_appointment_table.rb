class CreateEmployeeAppointmentTable < ActiveRecord::Migration
  def change
    create_join_table :employees, :appointments
  end
end
