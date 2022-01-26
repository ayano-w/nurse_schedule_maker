class Schedule < ApplicationRecord

  belongs_to :nurse
  has_many :reviews, dependent: :destroy
  has_many :task_lists, dependent: :destroy


  # ログインユーザーがログイン日時にスケジュールを作成したか確認するメソッド。ヘッダーで使用
  def self.has_schedule?(nurse)
    find_by(created_at: Time.zone.now.all_day, nurse_id: nurse.id).present?
  end
  
  def self.collect_schedules(ward_id)
    nurse_ids = Nurse.attendance_nurse_ids(ward_id)
    where(created_at: Time.zone.now.all_day, nurse_id: [nurse_ids])
  end  

end
