class Store < ActiveRecord::Base

  has_many :employees
  has_many :shifts

  validates_presence_of :store_name, :store_label

end
