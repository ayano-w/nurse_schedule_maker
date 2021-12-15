class Nurse::TasksController < ApplicationController

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
      render :new
    end
  end

  #タスクの編集画面
  def edit
    @task = Task.find(params[:id])
    @task_list = TaskList.find(params[:task_list_id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to schedule_path(task.task_list.schedule_id)
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
