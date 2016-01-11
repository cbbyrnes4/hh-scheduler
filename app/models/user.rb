class User < ActiveRecord::Base

	# has_secure_password

	scope :sort_name, lambda { order("users.last_name, users.first_name") }
	scope :active, lambda { where(:status => 'active') }
	scope :inactive, lambda { where(:status => 'inactive') }
	scope :unconfirmed, lambda { where(:status => 'unconfirmed') }
	
	validates :email, :presence => true, :uniqueness => true

	def name
		"#{first_name} #{last_name}"
	end
end
