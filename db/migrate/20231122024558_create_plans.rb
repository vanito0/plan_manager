class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title, null: false, limit: 30
      t.boolean :fulltime_flag, null: false
      t.datetime :start_time
      t.datetime :finish_time
      t.date :plan_date
      t.boolean :must_flag, null: false
      t.text :content, limit: 300

      t.timestamps
    end
  end
end
