class Shift < ActiveRecord::Base

  belongs_to :store
  belongs_to :employee

  validates_presence_of :store_id
  def as_json(options = {})
    { :id => self.id, 
      :start_date => self.start_date.to_s,
      :end_date => self.end_date.to_s,
      :text => cal_name,
      # :text => self.employee.first_name,
      :event_text => self.store.store_label,
      :color => calendar_color,
      # :text => "it worked",
    }
  end

  def calendar_color
    if self.employee_id.nil?
      @color = "green"
    elsif self.employee.role == "barista"
      @color = "blue"
    else
      @color = "orange"
    end
  end

  def cal_name
    if self.employee_id.nil? 
      @name = "available"
    else
      @name = self.employee.first_name
    end
  end

end

ActiveSupport.use_standard_json_time_format = false
