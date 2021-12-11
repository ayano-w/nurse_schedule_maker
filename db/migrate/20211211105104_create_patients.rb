class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name, null:false
      t.date :bithday, null:false
      t.integer :ward_id, null:false
      t.timestamps
    end
  end
end
