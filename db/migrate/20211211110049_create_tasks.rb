class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :task_list_id, null:false
      t.string :task, null:false
      t.boolean :status, defalt: true
      t.float :rate
      t.time :task_start_time, null:false
      t.timestamps
    end
  end
end
