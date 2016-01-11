class User < ActiveRecord::Base

	# has_secure_password
	# add front-end validation for password and phone number later

	scope :sort_name, lambda { order("users.last_name, users.first_name") }
	scope :sort_by_status, lambda { order("users.status") }
	scope :active, lambda { where(:status => 'active') }
	scope :inactive, lambda { where(:status => 'inactive') }
	scope :unconfirmed, lambda { where(:status => 'unconfirmed') }
	
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates :wage, :presence => true
	validates :status, :presence => true

	def name
		"#{first_name} #{last_name}"
	end
end
