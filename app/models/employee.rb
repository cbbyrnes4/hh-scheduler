class Employee < User
	has_and_belongs_to_many :appointments, join_table: "appointments_employees", polymorphic: true

	scope :sort_by_type, lambda { order('users.type') }
end

require_dependency 'mover'
require_dependency 'driver'
