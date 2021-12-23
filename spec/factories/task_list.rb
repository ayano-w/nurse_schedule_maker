FactoryBot.define do
  factory :task_list do
    association :schedule
    association :patient
  end
end