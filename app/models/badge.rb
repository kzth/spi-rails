class Badge < ActiveRecord::Base
  attr_accessible :id, :badge_name, :badge_info, :get_time, :get_point_at, :get_level_at
  has_and_belongs_to_many :users
end
