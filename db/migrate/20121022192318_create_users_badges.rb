class CreateUsersBadges < ActiveRecord::Migration
  def up
    create_table :users_badges, :id => false do |t|
      t.references :users
      t.references :badges

    end
  end

  def down
    drop_table :users_badges
  end
end
