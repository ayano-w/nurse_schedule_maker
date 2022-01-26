class Nurse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]


   belongs_to :ward
   has_many :schedules, dependent: :destroy
   has_many :reviews, class_name: "Review",foreign_key:"reviewer_nurse_id", dependent: :destroy

   #Nursesのnameカラムnullでも可（病棟が消えるとnullになる可能性があるため）だが、入力時は必須項目
   validates :name, presence: true, uniqueness: true
   validates :ward, presence: true


  #emailの設定をdeviseから除外する
   def email_required?
     false
   end

   def email_changed?
     false
   end

  # ログイン看護師と同じ病棟かつ出勤日の看護師を抽出
   def self.attendance_nurse(nurse)
      where(ward_id: nurse.ward_id, attendance: true)
   end

end
