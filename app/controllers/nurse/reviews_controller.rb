class Nurse::ReviewsController < ApplicationController
  before_action :authenticate_nurse!
  before_action :nurse_ward_nil?

  #特定のスケジュールに紐づくレビュー一覧を表示
  def index
    @reviews = Review.where(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  # スコアの計算
  def confirm
    @review = Review.new(review_params)
    @review.score = Language.get_data(review_params[:review])
    # redirect_to  schedule_path(@review.schedule_id)


    # #以下はschedule showを表示させるためのインスタンス変数
    # @schedule = Schedule.find(params[:schedule_id])
    # #スケジュールに紐づく患者のスケジュール（１行分）を表示させる
    # @task_list = TaskList.new
    # @task_lists = TaskList.includes(:tasks).where(schedule_id: params[:id])
    # # 患者選択用
    # @patients = Patient.where(ward_id: current_nurse.ward_id)
  end

  #レビューの新規投稿
  # def create
  #   review = Review.find_by(schedule_id: params[:schedule_id], reviewer_nurse_id: current_nurse)

  #   if review.save
  #     redirect_to schedule_reviews_path(review.schedule_id)
  #   else
  #     redirect_to  schedule_path(params[:schedule_id]), notice: '既にレビュー済みです'
  #   end
  # end

  #レビューの新規投稿
  def create
    review = Review.new(review_params)
    review.score = Language.get_data(review_params[:review])
    if review.save
      redirect_to schedule_reviews_path(review.schedule_id)
    else
      redirect_to  schedule_path(params[:schedule_id]), notice: '既にレビュー済みです'
    end
  end

  #レビューの更新
  def update
    review = Review.find(params[:id])
    review.score = Language.get_data(review_params[:review])
    review.update(review_params)
    redirect_to schedule_reviews_path(review.schedule_id)
  end

  #レビューの削除
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to schedule_reviews_path(params[:schedule_id])
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_nurse_id, :schedule_id, :review)
  end

end
