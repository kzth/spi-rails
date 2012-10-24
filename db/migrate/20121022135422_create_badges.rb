class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :badge_name, null: false
      t.string :badge_info
      t.datetime :get_time
      t.integer :get_point_at
      t.integer :get_level_at

      t.timestamps
    end
  end
end
