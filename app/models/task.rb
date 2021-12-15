class Task < ApplicationRecord

  belongs_to :task_list

  #優先度を3つの星表示するためのバリデーション
  validates :rate, numericality: {
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: 1}, presence: true


  #タスクリスト（スケジュールの中の各患者の行）に関連するタスクを集めるメソッド
  def self.collect_tasks(task_list)
    where(task_list_id: task_list.id)
  end


end
