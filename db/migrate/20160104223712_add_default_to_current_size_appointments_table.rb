class AddDefaultToCurrentSizeAppointmentsTable < ActiveRecord::Migration
  def up
  	change_column :appointments, :job_size, :integer, :nil => false
  	change_column :appointments, :current_size, :integer, :default => 0
  end
  def down
  	change_column :appointments, :current_size, :integer
  	change_column :appointments, :job_size, :integer
  end
end
