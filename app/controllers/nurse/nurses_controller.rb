class Nurse::NursesController < ApplicationController
  before_action :authenticate_nurse!

  def show
    @nurse = current_nurse
    @schedules = current_nurse.schedules.order("created_at DESC").page(params[:page]).per(10)
  end

  def update
    nurse = current_nurse
    nurse.update(nurse_params)
    redirect_to mypage_path, notice: "編集に成功しました"
  end

  private

  def nurse_params
    params.require(:nurse).permit(:name, :ward_id)
  end

end
