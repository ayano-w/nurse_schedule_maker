# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# 病棟の初期データ。全４病棟
2.times do |n|
  Ward.create!(
    [{ward_name: "#{ n + 1 }S"}, {ward_name: "#{ n + 1 }N"}]
    )
end

# 管理者のサンプル。１病棟1名、名前は小文字で病棟名。
Ward.all.each do |ward|
  ward.admins.create!(
    name: "#{ ward.ward_name }",
    password: "password"
  )
end

# 看護師のサンプル。１病棟10名ずつの設定。
Ward.all.each do |ward|
  10.times do |n|
    sample_name = Faker::Name.name
    ward.nurses.create!(
      name: sample_name,
      password: "password"
      )
  end
end

# 患者のサンプル。１病棟20名ずつの設定
Ward.all.each do |ward|
  20.times do |n|
    sample_name = Faker::Name.name
    birthday = Faker::Date.birthday
    ward.patients.create!(
      name: sample_name,
      birthday: birthday
      )
  end
end

# スケジュールのサンプル。看護師ごとにスケジュールを二つずつ作成。
Nurse.all.each do |nurse|
  created_at_a = Faker::Date.between(from: 2.days.ago, to: Date.today)
  created_at_b = Faker::Date.between(from: 5.days.ago, to: 3.days.ago)
  nurse.schedules.create!(
    [{created_at: created_at_a}, {created_at: created_at_b}]
    )
end

# タスクリスト（スケジュールの中身）のサンプル
Schedule.all.each do |schedule|
  patients = Patient.where(ward_id: schedule.nurse.ward_id)
  schedule.task_lists.create!(
    patient_id: "#{(patients.where('id>=?', rand(patients.first.id..patients.last.id)).first).id}"
    )
end