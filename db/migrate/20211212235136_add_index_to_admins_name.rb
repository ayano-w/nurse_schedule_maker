class AddIndexToAdminsName < ActiveRecord::Migration[5.2]

  # 管理者の認証をnameにするためにuniqueを設定
  def change
    add_index :admins, :name, :unique => true
  end
end
