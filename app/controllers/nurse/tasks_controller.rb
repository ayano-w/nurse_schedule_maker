class Nurse::TasksController < ApplicationController
  def new
    @task = Task
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    task = Task.find(task_params)
    task.save
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:task, :task_start_time, :rate, :task_list_id)
  end

end
