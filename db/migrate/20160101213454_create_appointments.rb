class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.string "customer_first_name", limit: 64, null: false
    	t.string "customer_last_name", limit: 64, null: false
    	t.string "street_address", null: false
    	t.string "city", null: false
    	t.string "state", null: false
    	t.string "country", null: false
    	t.string "zip", null: false
    	t.string "type"
    	t.string "status"
    	t.integer "job_size"
    	t.integer "estimated_time"
      t.timestamps null: false
    end
  end
end

# add actual time for payrol purposes later
