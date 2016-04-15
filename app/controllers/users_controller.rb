class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.location = request.location.city if params[:location].nil?
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    @pieces = @user.favorites.map{|favorite| favorite.piece}
  end

  def edit
    @user = User.find_by id: params[:id]
    redirect_to root_path if @user != @current_user
  end

  def update
    @user = User.find_by id: params[:id]
    @user.location = request.location.city if params[:location].nil?
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

  def favorite_piece
    @user = User.find_by id: params[:user_id]
    @piece = Piece.find_by id: params[:piece_id]

    @favorite = Favorite.new
    @favorite.user = @user
    @favorite.piece = @piece
    @favorite.save
    redirect_to root_path
  end

  def unfavorite_piece
    @user = User.find_by id: params[:user_id]
    @favorite = Favorite.find_by user_id: params[:user_id], piece_id: params[:piece_id]
    @favorite.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :latitude, :longitude, :location)
  end
end
