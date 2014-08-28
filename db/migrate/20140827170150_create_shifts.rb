class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.belongs_to :employee
      t.belongs_to :store
      t.datetime :start_time
      t.integer :duration
      t.timestamps
    end
  end
end
