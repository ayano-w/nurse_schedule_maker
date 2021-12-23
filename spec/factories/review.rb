FactoryBot.define do
  factory :review do
    association :schedule
    association :nurse
    review { Faker::Lorem.characters(number: 100) }
  end
end