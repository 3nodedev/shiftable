class RemoveStartTimeAddStartDate < ActiveRecord::Migration
  def change
    remove_column :shifts, :duration
    remove_column :shifts, :start_time
    add_column :shifts, :start_date, :datetime
    add_column :shifts, :end_date, :datetime
  end
end
