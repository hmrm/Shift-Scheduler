class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.float :hours
      t.timestamps
    end
  end
end
