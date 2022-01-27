class Nurse::ReviewsController < ApplicationController
  before_action :authenticate_nurse!, :nurse_ward_nil?
  before_action :set_new_review, only: [:confirm, :create]
  before_action :set_review, only: [:update, :destroy]
  before_action :ensure_correct_nurse, only:[:update, :destroy]


  #特定のスケジュールに紐づくレビュー一覧を表示
  def index
    @reviews = Review.where(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  # スコアの計算と確認アラート表示
  def confirm
    @review.score = Language.get_data(review_params[:review])
  end

  #レビューの新規投稿
  def create
    if @review.save
    else
      render status: 500, json: { status: 500, message: "FAILED"}
    end
  end

  #レビューの更新
  def update
    @review.score = Language.get_data(review_params[:review])
    @review.update(review_params)
    redirect_to schedule_reviews_path(@review.schedule_id)
  end

  #レビューの削除
  def destroy
    @review.destroy
    redirect_to schedule_reviews_path(params[:schedule_id])
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_nurse_id, :schedule_id, :review, :score)
  end

  def set_new_review
    @review = Review.new(review_params)
  end

  def set_review
    @review =  Review.find(params[:id])
  end
  
  def ensure_correct_nurse
    unless @review.reviewer_nurse_id == current_nurse.id
      redirect_to schedules_path, notice: "他人のレビューを編集・削除することはできません"
    end
  end


end
