class Plan < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, length: { maximum: 300 }
  validate :overflow, on: :create
  # 終日フラグがfalseの場合のバリデーション
  with_options unless: :fulltime_flag? do
    validates :start_time, presence: true
    validates :finish_time, presence: true
    validate :compare_time
    validate :compare_date
  end
  # 終日フラグがtrueの場合のバリデーション
  with_options if: :fulltime_flag? do
    validates :plan_date, presence: true
  end
  # 終了時刻が開始時刻より前の場合にエラーを返す
  def compare_time
    if start_time.present? && finish_time.present? && start_time > finish_time
      errors.add(:finish_time, "は開始より後にしてください")
    end
  end

  # 開始と終了の日付が違う場合にエラーを返す
  def compare_date
    if start_time.present? && finish_time.present? && start_time.strftime("%Y/%m/%d") != finish_time.strftime("%Y/%m/%d")
      errors.add(:start_time, "と終了は同じ日付にしてください")
    end
  end

  #1日に登録できる最大数を超過した場合エラーを返す
  def overflow
    date = nil
    if start_time.present?
      date = start_time.to_date
    else
      date = plan_date
    end
    one_day_plans = Plan.where("start_time >= ? or plan_date >= ?", date, date)
                    .where("finish_time <= ? or plan_date <= ?", date, date)
    if one_day_plans.size >= 5
      errors.add(:start_time, "の日は予定がいっぱいです!")
    end
  end
end
