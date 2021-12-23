FactoryBot.define do
  factory :nurse do
    association :ward
    name { Faker::Name.name }
    password { Faker::Lorem.characters(number: 10) }
    attendance { Faker::Boolean.boolean }
  end
end