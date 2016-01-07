class AlterAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :country
  end
end
