class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :nurse_id, null:false
      t.timestamps
    end
  end
end
