class Employee < ActiveRecord::Base
	belongs_to :department, class_name: 'Department', foreign_key: 'department_id', inverse_of: :employees
	validates_presence_of :department

	accepts_nested_attributes_for :department

	attr_accessor :department_id

	before_validation :set_selected_department

	def self.import(file)
		Employee.destroy_all
		CSV.foreach(file.path, headers: false) do |row|
			first_name, last_name, email, gender, department, department_contact, contact_email = row
			dept = Department.find_by(name: department)
			Employee.create(first_name: first_name, last_name: last_name, email: email, gender: gender, department: dept)
		end
	end

	private
	def set_selected_department
		if department_id && department_id != '0'
		  self.department = Department.find(departmnet_id)
		end
	end
end
