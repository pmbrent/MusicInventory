class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url
    else
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end
end
