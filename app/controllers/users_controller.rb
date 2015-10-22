class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sessions[:session_token] = @user.session_token
      redirect_to user_url
    else
      render :new
    end
  end

  def show
  end

  def destroy

  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
