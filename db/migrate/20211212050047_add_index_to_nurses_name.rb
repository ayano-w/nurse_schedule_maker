class AddIndexToNursesName < ActiveRecord::Migration[5.2]
  def change

    add_index :nurses, :name, :unique => true

  end
end
