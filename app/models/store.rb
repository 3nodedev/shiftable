class Store < ActiveRecord::Base

  has_many :employees
  has_many :shifts

end