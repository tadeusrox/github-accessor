class UsersController < ApplicationController
  def show
    @user = current_user
    if current_user.login == params[:name]
      @user = current_user
    else
      redirect_to root_path
    end
  end
end
