class Nurse::HomesController < ApplicationController
  def top
    if nurse_signed_in?
      @nurses = Nurse.where(ward_id: current_nurse.ward_id)
      @nurses = @nurses.where(attendance: true)
    end
  end
end
