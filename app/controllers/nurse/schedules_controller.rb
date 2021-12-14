class Nurse::SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
    @schedules = Schedule.where(nurse_id: params[:nurse_id], created_at: Date.today)

    # if @schedules.exists? == true
    @task_list = TaskList.new
    @task_lists = TaskList.where(schedule_id: params[:id])

    # #表示させるスケジュールに紐づく看護師
    # @nurse = Nurse.find(params[:nurse_id])
    # else
    #   redirect_to new_schedule_path
    # end
  end

  def index
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
