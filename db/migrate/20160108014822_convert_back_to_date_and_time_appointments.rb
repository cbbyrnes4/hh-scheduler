class ConvertBackToDateAndTimeAppointments < ActiveRecord::Migration
  def up
  	remove_column :appointments, :datetime 
  	add_column :appointments, :date, :date
  	add_column :appointments, :time, :time
  end
  def down
  	remove_column :appointments, :time
  	remove_column :appointments, :date
  	add_column :appointments, :datetime, :datetime
  end
end
