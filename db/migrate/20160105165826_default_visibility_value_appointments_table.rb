class DefaultVisibilityValueAppointmentsTable < ActiveRecord::Migration
  def up
  	change_column :appointments, :visibility, :boolean, :default => true
  end
  def down
  	change_column :appointments, :visibility, :boolean
  end
end
