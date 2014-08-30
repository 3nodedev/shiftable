require 'active_model_serializers'
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

class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :updated_at, :store_id, :employee_id, :created_at
end
