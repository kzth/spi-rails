class User < ActiveRecord::Base
  attr_accessible :id, :account_name, :password, :logout_at, :login_count, :sum_time, :level, :point

  has_and_belongs_to_many :badges
end
