class Appointment < ActiveRecord::Base
	has_and_belongs_to_many :employees, join_table: "appointments_employees", polymorphic: true

	accepts_nested_attributes_for :employees

	scope :sort_by_time, lambda { order('appointments.datetime') }
	scope :sort_by_customer_name, lambda { order('appointments.customer_last_name', 'appointments.customer_first_name') }
	scope :sort_by_status, lambda { order('appointments.status') }
	scope :active, lambda { where(:status => 'active') }
	scope :inactive, lambda { where(:status => 'inactive') }
	scope :visible, lambda { where(:visibility => true) }
	scope :invisible, lambda { where(:visibility => false) }

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :customer_first_name, :presence => true, :length => { :maximum => 64 }
	validates :customer_last_name, :presence => true, :length => { :maximum => 64 }
	validates :street_address, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true
	validates :zip, :presence => true
	validates :job_size, :presence => true, :numericality => { :greater_than_or_equal_to => 2, :less_than_or_equal_to => 7 }
	validates :current_size, :presence => true
	validates :job_size, :numericality => { :greater_than_or_equal_to => :current_size, :message => " must be greater than or equal to the current size of the appointment." }
	validates :email, :format => EMAIL_REGEX
	validates :phone_number, :presence => true

	def add_employee(id)
		employee = Employee.find(id)
		if self.current_size < self.job_size and !self.employees.include? employee
			# if job is `LongDistance` or `Local` and the last employee is not a `Driver` and there are no `Driver`s in the table already, throw error message 
			if !self.is_a? Labor and !self.has_driver? and !employee.is_a? Driver and self.current_size == self.job_size-1
				errors.clear
				errors.add(:employees, "Need at least one driver per #{self.class} appointment.")
			else
				self.employees << employee
				self.current_size += 1
				self.visibility = false if self.job_size == self.current_size	
				self.save
			end
		elsif self.employees.include? employee
			errors.clear
			errors.add(:employees, "Cannot add the same employee more than once.")
		else
			errors.clear
			errors.add(:employees, "Appointment is filled. Cannot add more employees.")
		end
	end

	def delete_employee(id)
		employee = Employee.find(id)
		if self.current_size > 0 and self.employees.include? employee
			self.employees.delete(id)
			self.current_size -= 1
			self.visibility = true
			self.save
		else
			errors.clear
			errors.add(:employees, "Appointment size is already zero.")
		end
	end

	def has_driver?
		self.employees.each do |employee| 
			if employee.is_a? Driver 
				return true
			end
		end
		return false
	end

	def name
		"#{customer_first_name} #{customer_last_name}"
	end

end