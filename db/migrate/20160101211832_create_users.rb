class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "type"
    	t.string "first_name", limit: 64, null: false
    	t.string "last_name", limit: 64, null: false
    	t.string "username", limit: 24
    	t.string "password", limit: 30
    	t.string "email", null: false
    	t.string "phone_number"
    	t.string "status"
    	t.string "wage"
      t.timestamps null: false
    end
  end
end
