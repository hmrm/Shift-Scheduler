class CreateShiftTimes < ActiveRecord::Migration
  def change
    create_table :shift_times do |t|
      t.string :day_of_week
      t.time :time_of_day

      t.timestamps
    end
  end
end
