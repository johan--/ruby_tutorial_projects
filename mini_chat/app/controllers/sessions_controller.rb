class SessionsController < ApplicationController
  def create
    # For Debugging purposes use this line
    # render text: request.env['omniauth.auth'].to_yaml
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies[:user_id] = user.id
    flash[:success] = "Hello, #{user.name}!"
    redirect_to root_url
  end

  def destroy
    cookies.delete(:user_id)
    flash[:success] = "See you!"
    redirect_to root_url
  end

  def auth_fail
    render text: "You've tried to authenticate via #{params[:strategy]}, but the following error occurred: #{params[:message]}", status: 500
  end
end
