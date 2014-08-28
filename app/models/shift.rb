class Shift < ActiveRecord::Base

  belongs_to :store
  belongs_to :employee

  validates_presence_of :employee_id, :store_id

end

