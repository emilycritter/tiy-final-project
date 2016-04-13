class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.ip_address = remote_ip
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def edit
    @user = User.find_by id: params[:id]
    redirect_to root_path if @user != @current_user
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update user_params
      redirect_to user_path(id: @user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = @current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :latitude, :longitude)
  end
end
