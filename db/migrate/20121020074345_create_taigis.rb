class CreateTaigis < ActiveRecord::Migration
  def change
    create_table :taigis do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :level
      t.string :category

      t.timestamps
    end
  end
end
