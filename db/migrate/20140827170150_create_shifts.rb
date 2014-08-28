class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :start_time
      t.string :duration
      t.string :date
      t.timestamps
    end
  end
end
