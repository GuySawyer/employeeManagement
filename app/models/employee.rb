class Employee < ActiveRecord::Base
	belongs_to :department

	def self.import(file)
	  CSV.foreach(file.path, headers: false) do |row|
	    first_name, last_name, email, gender = row
	    Employee.create(first_name: first_name, last_name: last_name, email: email, gender: gender)
	  end
	end
end
