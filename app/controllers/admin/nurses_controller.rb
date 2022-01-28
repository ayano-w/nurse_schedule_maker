class Admin::NursesController < ApplicationController
  before_action :authenticate_admin!
  before_action :admin_ward_nil?


  def index
    admin_ward_id = current_admin.ward_id
    @nurses = Nurse.where(ward_id: admin_ward_id)

  end

  def update
    nurse = Nurse.find(params[:id])

    # 看護師が出勤中だった場合、リンクをクリックすると休日に変更
    if nurse.attendance == true
      nurse.attendance = false
      nurse.save

    # 看護師が休日だった場合、リンクをクリックすると出勤中に変更
    elsif
      nurse.attendance = true
      nurse.save
    end
    redirect_to admin_nurses_path
  end

  private
  def nurse_params
    params.require(:nurse).permit(:name, :ward_id, :attendance)
  end

  def nurses_params
    params.require(:nurse).permit(nurses: [:attendance])[:nurses]
  end




end
