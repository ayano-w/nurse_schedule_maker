class CreateWards < ActiveRecord::Migration[5.2]
  def change
    create_table :wards do |t|
      t.string :ward_name, null:false
      t.timestamps
    end
  end
end
