class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.where("email ILIKE ?", email).first
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end

  private
end
