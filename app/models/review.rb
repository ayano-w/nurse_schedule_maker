class Review < ApplicationRecord
  
  belongs_to :schedule
  belongs_to :reviewer_nurse, class_name: "Nurse"
  
end
