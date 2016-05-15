class SessionsController < ApplicationController
  def authorize
    redirect_to "http://github.com/login/oauth/authorize?#{authorize_query}"
  end

  def create
    redirect_to root_path
  end

  private

  def authorize_query
    {
      client_id: github_configs['client_id'],
      redirect_uri: github_configs['redirect_uri'],
      scope: github_configs['scope'],
      state: session_state
    }.to_query
  end


  def github_configs
    Rails.application.config_for('github')
  end
end
