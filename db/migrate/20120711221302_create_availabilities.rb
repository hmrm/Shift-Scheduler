class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :available
      t.integer :tutor_id
      t.integer :shift_time_id

      t.timestamps
    end
  end
end
