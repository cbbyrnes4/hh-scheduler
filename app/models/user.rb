class User < ActiveRecord::Base

	has_secure_password

	scope :sort_name, lambda { order("users.last_name, users.first_name") }
	scope :sort_active, lambda { order("users.status")}

	validates :email, :uniqueness => true

	def name
		"#{first_name} #{last_name}"
	end
end
