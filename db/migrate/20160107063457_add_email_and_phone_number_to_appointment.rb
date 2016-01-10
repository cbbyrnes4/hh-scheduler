class AddEmailAndPhoneNumberToAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :email, :string
  	add_column :appointments, :phone_number, :string
  end
end
