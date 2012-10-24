# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  # ユーザーのポイントを加算する関数
  def add_point(user_id, p = 10)
    user = User.find(user_id);
    user_p = user.point
    new_p = user_p + p
    user.update_attribute(:point, new_p)
    check_point(new_p, user)
    new_p
  end

  # pointをチェックし、レベルアップを行う
  def check_point(point, user)
    point_info = Point.where('point < :p', {p: point}).order('point DESC').first
    if point_info
      lvl = point_info.level_at
    else
    end
    puts lvl
    if (lvl - 1) == user.level
      user.update_attribute(:level, lvl)
      flash[:levelup] = "レベルが#{lvl}に上がりました"
    end
  end
end
