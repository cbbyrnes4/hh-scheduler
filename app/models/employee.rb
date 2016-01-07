class Employee < User
	has_and_belongs_to_many :appointments, join_table: "appointments_employees", polymorphic: true

	FORBIDDEN_USERNAMES = ['president','hhmanager', 'hh-manager', 'hh_manager','admin', 'manager','cto','cfo','ceo']

	validate :username_is_allowed

	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(self.username.downcase)
			errors.add(:username,"Username has been restricted from use.")
		end
	end

end

require_dependency 'mover'
require_dependency 'driver'
