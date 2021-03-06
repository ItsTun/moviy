class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.from_fb(params)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end