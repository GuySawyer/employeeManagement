class Department < ActiveRecord::Base
	has_many :employees, foreign_key: :department_id

	def self.import(file)
		Department.destroy_all
		CSV.foreach(file.path, headers: false) do |row|
			first_name, last_name, email, gender, department, department_contact, contact_email = row
			Department.find_or_create_by(name: department, contact: department_contact, contact_email: contact_email)
		end
	end
end
