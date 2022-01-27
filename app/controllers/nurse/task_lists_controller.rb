class Nurse::TaskListsController < ApplicationController
  before_action :authenticate_nurse!, :nurse_ward_nil?

  #スケジュール作成画面で患者選択→追加を押すとスケジュールに選択した患者の行が追加される。
  def create
    task_list = TaskList.new(task_list_params)
    task_list.save
    redirect_to schedule_path(task_list.schedule_id)
  end

  #スケジュール画面で"行を削除"を押下すると該当患者の行が削除される。
  def destroy
    task_list = TaskList.find(params[:id])
    schedule = task_list.schedule_id
    task_list.destroy
    redirect_to schedule_path(schedule)
  end

  private
  def task_list_params
    params.require(:task_list).permit(:patient_id, :schedule_id)
  end

end
