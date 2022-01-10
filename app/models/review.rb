class Review < ApplicationRecord

  belongs_to :schedule
  belongs_to :reviewer_nurse, class_name: "Nurse"

  validates :schedule_id, uniqueness: {scope: :reviewer_nurse_id}

end
