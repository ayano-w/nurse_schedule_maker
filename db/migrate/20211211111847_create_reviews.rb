class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_nurse_id, null:false
      t.integer :schedule_id, null:false
      t.text :review, null:false
      t.timestamps
    end
  end
end
