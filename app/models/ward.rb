class Ward < ApplicationRecord

  #nullify:病棟が消えた場合に看護師、管理者、患者が消えないようにする
  has_many :nurses, dependent: :nullify
  has_many :patients, dependent: :nullify
  has_many :admins, dependent: :nullify

end
