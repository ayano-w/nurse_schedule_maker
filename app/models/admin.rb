class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :ward
  #Adminのnameカラムはnull:false設定なし（病棟が消えるとnullになる可能性があるため）、入力時は必須項目
  validates :name, presence: true
  validates :ward, presence: true


  #emailの設定をdeviseから除外する
   def email_required?
     false
   end

   def email_changed?
     false
   end

end
