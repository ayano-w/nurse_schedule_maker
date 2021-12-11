class CreateTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.integer :patient_id, null:false
      t.integer :schedule_id, null:false
      t.timestamps
    end
  end
end
