class Patient < ApplicationRecord

  belongs_to :ward
  has_many :task_lists, dependent: :destroy
  #has_many :resevations, dependent: :destroy

end
