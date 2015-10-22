class SessionsController < ApplicationController

  def new
  end

  def create

  end

  def destroy
    current_user.reset_session_token
    sessions[:session_token] = nil
    redirect_to :new
  end
end
