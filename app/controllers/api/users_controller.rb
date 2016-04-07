class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @users = User.all.order("full_name asc")
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def me
    @user = User.find_by id: @current_user.id
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
    @user = User.find_by id: params[:id]
    @user.destroy
    head :ok
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number)
  end
end
