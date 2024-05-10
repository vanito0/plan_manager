# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

date2 = Date.new(2024, 2, 2)
date3 = Time.new(2024, 2, 3)
date4 = Time.new(2024, 2, 4)
date5 = Time.new(2024, 1, 29)
datetime2 = Time.new(2024, 2, 2, 9)
datetime3 = Time.new(2024, 2, 4, 10)
datetime4 = Time.new(2024, 1, 29, 0)
puts"plan作成"
# ↓テスト用データ
Plan.create!(title: 'タイトル1', fulltime_flag: true, plan_date: date2, must_flag: true, content: 'タイトル表示確認')
Plan.create!(title: 'タイトル2', fulltime_flag: false, start_time: datetime2, finish_time: datetime2 + 3600, must_flag: false, content: '終日表示確認,重要予定表示確認')
Plan.create!(title: 'タイトル3', fulltime_flag: false, start_time: datetime2 + 32400, finish_time: datetime2 + 39600, must_flag: true, content: '重要表示確認,時間表示確認')
Plan.create!(title: 'タイトル4', fulltime_flag: true, plan_date: date3, must_flag: false, content: '戻る確認(詳細)')
Plan.create!(title: 'タイトル5', fulltime_flag: true, plan_date: date4, must_flag: true, content: '日付、曜日表示確認,並び順確認')
Plan.create!(title: 'タイトル6', fulltime_flag: false, start_time: datetime3, finish_time: datetime3 + 21600, must_flag: true, content: '並び順確認')
Plan.create!(title: 'タイトル7', fulltime_flag: false, start_time: datetime3 + 14400, finish_time: datetime3 + 32400, must_flag: true, content: '並び順確認')
Plan.create!(title: 'タイトル8', fulltime_flag: true, plan_date: date4, must_flag: true, content: '削除確認（重要予定')
Plan.create!(title: 'タイトル9', fulltime_flag: true, plan_date: date2, must_flag: false, content: '削除確認（予定一覧')
Plan.create!(title: 'タイトル10', fulltime_flag: false, start_time: datetime4, finish_time: datetime4 + 36000, must_flag: false, content: '週始め表示確認')
Plan.create!(title: 'タイトル11', fulltime_flag: false, start_time: datetime4 + 60, finish_time: datetime4 + 36000, must_flag: true, content: '週始め表示確認')
Plan.create!(title: 'タイトル12', fulltime_flag: true, plan_date: date5, must_flag: false, content: '週始め表示確認')
Plan.create!(title: 'タイトル13', fulltime_flag: false, start_time: datetime3 + 50340, finish_time: datetime3 + 50340, must_flag: false, content: '週終わり表示確認')