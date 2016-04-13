require 'open-uri'

class Api::UsersController < ApplicationController

  def index
    @users = User.all.order("last_name asc")
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def me
    if @current_user
      @user = User.find_by id: @current_user.id
    else
      render :index
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      render :show
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def update
    @user = User.find_by id: params[:id]

    if @user.update user_params
      render :show
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def destroy
    @user = User.find_by id: @current_user.id
    @user.destroy
    head :ok
  end

  def update_location
    @user = User.find_by id: @current_user.id

    if @user.update user_params
      render :show
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :latitude, :longitude)
  end
end
