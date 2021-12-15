class Nurse::ReviewsController < ApplicationController

  #特定のスケジュールに紐づくレビュー一覧を表示
  def index

    @reviews = Review.where(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  #レビューの投稿画面表示
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @review = Review.new
  end

  #レビューの新規投稿
  def create
    review = Review.new(review_params)
    review.save
    redirect_to schedule_reviews_path(review.schedule_id)
  end

  #レビューの更新画面表示
  def edit
  end

  #レビューの更新
  def update
  end

  #レビューの削除
  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_nurse_id, :schedule_id, :review)
  end

end
