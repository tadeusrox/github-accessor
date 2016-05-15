class SessionsController < ApplicationController
  def authorize
    redirect_to "http://github.com/login/oauth/authorize?#{authorize_query}"
  end

  def create
    client = Octokit.exchange_code_for_token(params[:code], github_configs['client_id'], github_configs['secret'])
    session[:access_token] = client[:access_token]
    redirect_to root_path
  end

  private

  def authorize_query
    {
      client_id: github_configs['client_id'],
      redirect_uri: github_configs['redirect_uri'],
      scope: github_configs['scope'],
      state: github_configs['secret']
    }.to_query
  end


  def github_configs
    Rails.application.config_for('github')
  end
end
