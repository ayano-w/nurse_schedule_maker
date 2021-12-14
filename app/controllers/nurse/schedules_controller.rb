class Nurse::SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def show
    schedule = Schedule.where(nurse_id: params[:nurse_id], created_at: Date.today)
    # if schedule.exists? == true
    @schedule = Schedule.find(params[:id])

    #ログイン看護師と同じ病棟で、かつ出勤中登録されている看護師（attendance: trueで出勤中）
    #プルダウンでスケジュール切替するときに使用
    @nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)

    #スケジュールに紐づく患者のスケジュール（１行分）を表示させる
    @task_list = TaskList.new
    @task_lists = TaskList.where(schedule_id: params[:id])


    # #表示させるスケジュールに紐づく看護師
    # @nurse = Nurse.find(params[:nurse_id])
    # else
    #   redirect_to new_schedule_path
    # end
  end

  def index
    @nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)
  end

  def create
    schedule = Schedule.new(schedule_params)
    schedule.save
    redirect_to schedule_path(schedule)
  end

  def destroy
  end


  private

  def schedule_params
    params.require(:schedule).permit(:nurse_id)

  end

end
