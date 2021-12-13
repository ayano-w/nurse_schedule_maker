class Nurse::NursesController < ApplicationController
  def show
    @nurse = current_nurse
  end

  def update
    nurse = current_nurse
    nurse.update(nurse_params)
    redirect_to mypage_path
  end

  private

  def nurse_params
    params.require(:nurse).permit(:name, :ward_id)
  end

end
