class Schedule < ApplicationRecord

  belongs_to :nurse
  has_many :reviews, dependent: :destroy
  has_many :task_lists, dependent: :destroy
  
  
  # def today_schedules 
  #   where(created_at: Time.zone.now.all_day)
  # end
  

end
