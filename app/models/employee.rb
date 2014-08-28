class Employee < ActiveRecord::Base

  belongs_to :store
  has_many :shifts

  validates_uniqueness_of :employee_id
  validates_presence_of :first_name, :last_name, :role, :password, :employee_id

end