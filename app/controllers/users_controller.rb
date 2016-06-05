class UsersController < ApplicationController
  def show
    if current_user.login == params[:name]
      @user = User.find_or_create_by(github_login: current_user.login)
      @user.github_user = current_user
    else
      redirect_to root_path
    end
  end
end
