class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :role
      t.string :password
      t.timestamps
      t.belongs_to :store
    end
  end
end
