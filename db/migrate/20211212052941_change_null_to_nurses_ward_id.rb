class ChangeNullToNursesWardId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :nurses, :ward_id, true
    change_column_null :admins, :ward_id, true
    change_column_null :patients, :ward_id, true
  end
end
