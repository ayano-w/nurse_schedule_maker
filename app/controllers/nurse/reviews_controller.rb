class Nurse::ReviewsController < ApplicationController
  before_action :authenticate_nurse!
  before_action :nurse_ward_nil?

  #特定のスケジュールに紐づくレビュー一覧を表示
  def index
    @reviews = Review.where(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  #レビューの新規投稿
  def create
    review = Review.new(review_params)
    review.save
    redirect_to schedule_reviews_path(review.schedule_id)
  end

  #レビューの更新
  def update
    review = Review.find(params[:id])
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
