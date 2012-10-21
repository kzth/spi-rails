class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_name, null: false
      t.string :password, null: false
      t.date :logout_at
      t.integer :login_count, default: 0
      t.datetime :sum_time
      t.integer :level, default: 1
      t.integer :point, default: 0

      t.timestamps
    end
  end
end
