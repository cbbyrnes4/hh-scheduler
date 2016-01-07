class AddVisibilityColumnToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :visibility, :boolean
  end
end
