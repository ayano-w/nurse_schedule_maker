class Nurse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   belongs_to :ward
   has_many :schedules, dependent: :destroy
   has_many :reviews, class_name: "Review",foreign_key:"reviewer_nurse_id", dependent: :destroy

end
