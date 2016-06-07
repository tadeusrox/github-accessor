class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :system_user

  def current_user
    @current_user ||= Github.new(session[:access_token]).user
  end

  def system_user
    @user ||= User.find_or_create_by(github_login: current_user.login)
    @user.github_user = current_user
    @user
  end
end
