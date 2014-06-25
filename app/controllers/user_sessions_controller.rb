class UserSessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_index_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
