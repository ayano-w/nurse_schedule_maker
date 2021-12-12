class Ward < ApplicationRecord

  has_many :nurses
  has_many :patients
  has_many :admins

end
