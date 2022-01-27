class AddDefaltToTasksRate < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :rate, 1.0
  end
end
