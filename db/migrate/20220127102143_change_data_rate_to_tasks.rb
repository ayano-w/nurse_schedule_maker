class ChangeDataRateToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :rate, :integer
  end
end
