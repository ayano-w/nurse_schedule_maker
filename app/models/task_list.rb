class TaskList < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :patient
  belongs_to :schedule

end
