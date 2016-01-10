class ActualTimeColumnAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :actual_time, :integer
  end
end
