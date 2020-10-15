class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :gender
      t.string :exercise_time
      t.integer :intake_cal
      t.integer :burned_cal
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
