class RenameBithdayColumToPatients < ActiveRecord::Migration[5.2]
  def change
    rename_column :patients, :bithday, :birthday
  end
end
