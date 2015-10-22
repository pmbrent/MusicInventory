class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

end
