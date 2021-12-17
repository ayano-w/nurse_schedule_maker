class Nurse::HomesController < ApplicationController
  def top
    if nurse_signed_in?
      #ログイン看護師と同じ病棟で、かつ出勤中登録されている看護師（attendance: trueで出勤中）
      @nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)

      # ログイン日にスケジュールを作成していなかった場合、新規作成ができる
      @schedules = Schedule.where(nurse_id: current_nurse, created_at: Time.zone.now.all_day)
      @schedule = Schedule.new
    end
  end
end
