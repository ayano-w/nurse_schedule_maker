class RenameIndexToNursesEmail < ActiveRecord::Migration[5.2]
  def change
    remove_index :nurses, column: [:email], name: "index_nurses_on_email"
    remove_index :admins, column: [:email], name: "index_admins_on_email"

  end
end
