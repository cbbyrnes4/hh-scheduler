class DefaultStatusAppointments < ActiveRecord::Migration
  def up
  	change_column :appointments, :status, :string, :default => 'active'
  end
  def down
  	change_column :appointments, :status, :string
  end
end
