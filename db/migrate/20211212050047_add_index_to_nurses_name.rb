class AddIndexToNursesName < ActiveRecord::Migration[5.2]
  
  # 看護師の認証をnameにするためにuniqueを設定
  def change
    add_index :nurses, :name, :unique => true
  end
end
