FactoryBot.define do
  factory :ward do
    ward_name { Faker::Lorem.characters(number: 3) }
  end
end