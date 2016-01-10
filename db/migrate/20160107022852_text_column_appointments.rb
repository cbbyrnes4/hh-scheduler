class TextColumnAppointments < ActiveRecord::Migration
  def up
  	add_column :appointments, :notes, :text 
  	change_column :appointments, :type, :string, :default => "Local"
  end
  def down
  	update_column :appointments, :type, :string
  	change_column :appointments, :notes, :text
  end
end
