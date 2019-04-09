class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?

  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user == nil?
  end

  def authenticate_user
    if !@current_user
      flash[:warning] = 'ログインしてください'
      redirect_to root_path
    end
  end
end
