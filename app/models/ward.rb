class Ward < ApplicationRecord

  #nullify:病棟が消えた場合に看護師、管理者が消えないようにする
  has_many :nurses, dependent: :nullify
  has_many :admins, dependent: :nullify

  # 病棟が消えたら患者と、紐づくスケジュールは消える
  has_many :patients, dependent: :destroy
end
