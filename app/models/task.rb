class Task < ApplicationRecord

  belongs_to :task_list

  validates :task, presence: true

  #優先度を3つの星表示するためのバリデーション
  validates :rate, numericality: {
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: 1}, presence: true


  #タスクリスト（スケジュールの中の各患者の行）に関連するタスクを集めるメソッド
  def self.collect_tasks(task_list)
    where(task_list_id: task_list.id).order(task_start_time: :asc)
  end


  # タスクの表示位置を開始時間に基づいて表示するための計算
  def calculation_task_position(task)
    ((task.task_start_time.seconds_since_midnight) - (60*60*8)) / (60*60*13) * 100
  end


end
