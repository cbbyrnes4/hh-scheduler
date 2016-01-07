class ChangeAppointmentTable < ActiveRecord::Migration
	def change
		add_column :appointments, :current_size, :integer
	end
end
