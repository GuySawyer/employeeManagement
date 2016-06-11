class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :contact
      t.string :contact_email

      t.timestamps null: false
    end
  end
end
