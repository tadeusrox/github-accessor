class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to user_users_path(current_user.user.login)
    end
  end
end
