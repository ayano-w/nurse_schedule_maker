class Nurse::HomesController < ApplicationController
  def top
    if nurse_signed_in?
      #ログイン看護師と同じ病棟で、かつ出勤中登録されている看護師（attendance: trueで出勤中）
      @nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)
    end
  end
end
