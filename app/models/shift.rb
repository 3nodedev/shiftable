class Shift < ActiveRecord::Base

  belongs_to :store
  belongs_to :employee

  validates_presence_of :employee_id, :store_id

end

ActiveSupport.use_standard_json_time_format = false

class ActiveSupport::TimeWithZone
  def as_json(options = {})
    # strftime('%Y-%m-%d %H:%M:%S')
  end
end

