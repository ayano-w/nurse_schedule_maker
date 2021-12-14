class Nurse::TasksController < ApplicationController
  def new
    @task = Task.new
    @task_list = TaskList.find
  end

  def create
    task = Task.find(task_params)
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:task, :task_start_time, :rate, :task_list_id)
  end

end
