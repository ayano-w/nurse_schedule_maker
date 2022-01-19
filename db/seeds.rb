# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'factory_bot_rails'

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

# 看護師のサンプル（固定の名前）
Nurse.create!(
  name: "テスト看護師(1S)",
  password: "password",
  ward_id: "1s"
)

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
  4.times do |n|
    patients = Patient.where(ward_id: schedule.nurse.ward_id)
    schedule.task_lists.create!(
      patient_id: "#{(patients.where('id>=?', rand(patients.first.id..patients.last.id)).first).id}"
     )
  end
end

# タスクのサンプル
TaskList.all.each do |task_list|
  3.times do |n|
    rate = Faker::Number.within(range: 1..3)
    r = Random.new
    task_start_time = (Time.local(2000, 1, 1, 8, 0, 0) + r.rand(6*10)*60*10) - (60*60*9)
    task_list.tasks.create!(
      task: "サンプル",
      rate: rate,
      task_start_time: task_start_time
    )
  end
end