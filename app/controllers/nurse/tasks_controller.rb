class Nurse::TasksController < ApplicationController
  before_action :authenticate_nurse!
  before_action :nurse_ward_nil?
  #タスクの作成画面
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  #タスクの作成
  def create
    @task = Task.new(task_params)
    @task_list = TaskList.find(params[:task_list_id])
    if @task.save
      redirect_to schedule_path(@task.task_list.schedule_id)
    else
      redirect_to new_task_list_task_path(params[:task_list_id]), alert: "タスク名を入力してください"
    end
  end

  #タスクの編集画面
  def edit
    @task = Task.find(params[:id])
    @task_list = TaskList.find(params[:task_list_id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to schedule_path(task.task_list.schedule_id)
    else
      redirect_to edit_task_list_task_path(params[:task_list_id],params[:id])
    end
  end

  def destroy
    task = Task.find(params[:id])
    task_list=TaskList.find(params[:task_list_id])
    task.delete
    redirect_to schedule_path(task_list.schedule_id)
  end

  private

  def task_params
    params.require(:task).permit(:task, :task_start_time, :rate, :task_list_id)
  end

end
