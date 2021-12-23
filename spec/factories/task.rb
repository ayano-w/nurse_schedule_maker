FactoryBot.define do
  factory :task do
    association :task_list
    task { Faker::Lorem.characters(number: 10) }
    rate { Faker::Number.within(range: 1..3) }
    task_start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end