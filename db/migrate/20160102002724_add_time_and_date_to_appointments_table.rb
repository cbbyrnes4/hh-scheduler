class AddTimeAndDateToAppointmentsTable < ActiveRecord::Migration
  def change
  	add_column :appointments, :date, :date
  	add_column :appointments, :time, :time 
  end
end
