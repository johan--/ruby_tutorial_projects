class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @user_session = UserSession.new(user_session_params)

    respond_to do |format|
      if @user_session.save
        flash[:success] = "Welcome back!"
        format.html { redirect_to root_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
