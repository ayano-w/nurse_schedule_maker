class Nurse::TasksController < ApplicationController
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    @task = Task.new(task_params)
    @task_list = TaskList.find(params[:task_list_id])
    if @task.save
      redirect_to schedule_path(@task.task_list.schedule_id)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @task_list = TaskList.find(params[:task_list_id])
  end

  def update
    task = Task.find(task_prams)
    task.update
    redirect_to schedule_path(task.task_list.schedule_id)
  end

  def destroy
    task = Task.find(task_prams)
    task.delete
    #多分エラーになる
    redirect_to schedule_path(task.task_list.schedule_id)


  end

  private

  def task_params
    params.require(:task).permit(:task, :task_start_time, :rate, :task_list_id)
  end

end
