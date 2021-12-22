class Schedule < ApplicationRecord

  belongs_to :nurse
  has_many :reviews, dependent: :destroy
  has_many :task_lists, dependent: :destroy
  
  # def has_schedule?
  #   schedule = Schedule.find_by(created_at: Time.zone.now.all_day, nurse_id: current_nurse.id)
  #   if  schedule.present? == true
  #     redirect_to schedule_path(scjedule.id)
  #   else
  #     redirect_to top_path
  #   end
  # end
  
  def has_schedule?
    find_by(created_at: Time.zone.now.all_day, nurse_id: current_nurse.id).present?
  end



end
