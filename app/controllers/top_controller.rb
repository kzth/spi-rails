class TopController < ApplicationController
  def index
  end

  def login
    user = User.find_by_account_name(params[:user][:account_name])
    if user
      if user.password.to_s == params[:user][:password].to_s
        set_session(user.id)

        # ログイン回数を増やす
        user.update_attribute(:login_count, user.login_count + 1)
        # ログイン日の更新
        user.update_attribute(:logout_at, Date.today)

        redirect_to user_path(user.id)
      elsif
        flash[:notice] = "miss_login, #{user.account_name} #{user.password}"
        redirect_to root_path
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def set_session(id)
    session[:user_id] = id
  end
end
