class CreateDougis < ActiveRecord::Migration
  def change
    create_table :dougis do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :level
      t.string :type

      t.timestamps
    end
  end
end
