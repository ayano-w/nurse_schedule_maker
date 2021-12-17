class Nurse::SchedulesController < ApplicationController

  # スケジュールの作成
  def new
    @schedule = Schedule.new
  end

  # スケジュールの詳細表示、編集
  def show
    @schedule = Schedule.find(params[:id])

    #ログイン看護師と同じ病棟で、かつ出勤中登録されている看護師（attendance: trueで出勤中）
    #プルダウンでスケジュール切替するときに使用
    @nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)

    #スケジュールに紐づく患者のスケジュール（１行分）を表示させる
    @task_list = TaskList.new
    @task_lists = TaskList.where(schedule_id: params[:id])
  end

  # 今日の日付で登録されている、ログイン看護師と同じ病棟の看護師スケジュール一覧
  def index
    # @schedulesに今日の日付かつ、ログインユーザーの所属する病棟かつ、出勤日の看護師のスケジュールを格納する
    schedules = Schedule.where(created_at: Time.zone.now.all_day)
    nurses = Nurse.where(ward_id: current_nurse.ward_id, attendance: true)
    nurse_id = []
    nurses.each do |nurse|
      nurse_id.push(nurse.id)
    end
      @schedules = schedules.where(nurse_id: [nurse_id] )

    # スケジュール表示で使う
    @task_list = TaskList.new
  end

  # スケジュールの作成
  def create
    schedule = Schedule.new(schedule_params)
    schedule.save
    redirect_to schedule_path(schedule)
  end

  # スケジュールの削除
  def destroy
    schedule = Schedule.find(params[:id])
    schedule_date = schedule.created_at.strftime("%Y%m%d")
    schedule.destroy
    if schedule_date == Date.today.strftime("%Y%m%d")
      redirect_to top_path
    else
      redirect_to mypage_path
    end

  end


  private

  def schedule_params
    params.require(:schedule).permit(:nurse_id)

  end

end
