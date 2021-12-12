class Schedule < ApplicationRecord

  belongs_to :nurse
  has_many :reviews, dependent: :destroy
  has_many :task_lists, dependent: :destroy


end
