class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
      @current_ip = remote_ip
    end
  end

  def authenticate_user!
    if @current_user.nil?
      redirect_to sign_in_path, alert: 'Please Sign In'
    end
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1' || request.remote_ip == '::1'
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

end
