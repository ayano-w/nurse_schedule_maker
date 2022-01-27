class Nurse::TasksController < ApplicationController
  before_action :authenticate_nurse!, :nurse_ward_nil?
  before_action :set_task_list
  before_action :set_task, only:[:edit, :update, :destroy]
  before_action :ensure_correct_nurse, only:[:edit, :update, :destroy]
  
  #タスクの作成画面
  def new
    @task = Task.new
  end

  #タスクの作成
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to schedule_path(@task.task_list.schedule_id)
    else
      redirect_to new_task_list_task_path(params[:task_list_id]), alert: "10文字以内のタスク名を入力してください"
    end
  end

  #タスクの編集画面
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to schedule_path(@task.task_list.schedule_id)
    else
      redirect_to edit_task_list_task_path(params[:task_list_id],params[:id]), alert: "10文字以内のタスク名を入力してください"
    end
  end

  def destroy
    @task.delete
    redirect_to schedule_path(@task_list.schedule_id)
  end


  private

  def task_params
    params.require(:task).permit(:task, :task_start_time, :rate, :task_list_id)
  end


  def set_task
    @task = Task.find(params[:id])
  end

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def ensure_correct_nurse
    schedule = Schedule.find_by(id: @task_list.schedule_id)
    unless schedule.nurse_id == current_nurse.id
      redirect_to schedules_path, notice: "他人のタスクを編集・削除することはできません"
    end
  end
end
