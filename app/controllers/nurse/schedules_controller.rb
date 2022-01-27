class Nurse::SchedulesController < ApplicationController
  before_action :authenticate_nurse!, :nurse_ward_nil?
  before_action :set_schedule, only:[:show, :destroy]

  # スケジュールの作成
  def new
    @schedule = Schedule.new
  end

  # スケジュールの詳細表示、編集
  def show
    #スケジュールに紐づく患者のスケジュール（１行分）を表示させる
    @task_list = TaskList.new
    @task_lists = TaskList.includes(:tasks).where(schedule_id: params[:id])

    # 患者選択用
    @patients = Patient.where(ward_id: current_nurse.ward_id)

    # レビュー投稿用
    @review = Review.new
    @review_alert = nil
  end

  # スケジュール一覧の表示(今日の日付、ログイン看護師と同じ病棟の看護師のもの）
  def index
    @schedules = Schedule.collect_schedules(current_nurse.ward)
  end

  # スケジュールの作成
  def create
    schedule = Schedule.new(schedule_params)
    schedule.save
    redirect_to schedule_path(schedule)
  end

  # スケジュールの削除
  def destroy
    schedule_date = @schedule.created_at.strftime("%Y%m%d")
    @schedule.destroy
    if schedule_date == Date.today.strftime("%Y%m%d")
      redirect_to top_path, notice: 'スケジュールを削除しました'
    else
      redirect_to mypage_path, notice: 'スケジュールを削除しました'
    end
  end


  private

  def schedule_params
    params.require(:schedule).permit(:nurse_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

end
