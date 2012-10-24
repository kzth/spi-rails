class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points, id: false do |t|
      t.integer :point, null: false
      t.integer :level_at, null: false

      t.timestamps
    end
  end
end
