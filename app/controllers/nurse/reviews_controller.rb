class Nurse::ReviewsController < ApplicationController
  def index
  end

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @review = Review.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
