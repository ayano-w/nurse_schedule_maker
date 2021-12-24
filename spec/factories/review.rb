FactoryBot.define do
  factory :review do
    association :schedule
    association :reviewer_nurse, factory: :nurse
    review { Faker::Lorem.characters(number: 100) }
  end
end