class ConvertBackTodatetime < ActiveRecord::Migration
  def up
  	remove_column :appointments, :date
	remove_column :appointments, :time
  	add_column :appointments, :datetime, :datetime
  end
  def down
  	remove_column :appointments, :datetime
  	add_column :appointments, :date, :date
  	add_column :appointments, :time, :time
  end
end
