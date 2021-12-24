FactoryBot.define do
  factory :patient do
    association :ward
    name { Faker::Name.name }
    birthday { Faker::Date.birthday }
  end
end