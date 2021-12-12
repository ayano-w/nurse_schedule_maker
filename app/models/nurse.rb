class Nurse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]


   belongs_to :ward
   has_many :schedules, dependent: :destroy
   has_many :reviews, class_name: "Review",foreign_key:"reviewer_nurse_id", dependent: :destroy

   #看護師の名前カラムはnull:false設定なし（病棟が消えるとnullになる可能性があるため）、入力時は必須項目
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
