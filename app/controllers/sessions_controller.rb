class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    redirect_to :admin
  end
  def destroy
    reset_session
    redirect_to :store
  end
end
