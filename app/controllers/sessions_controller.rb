class SessionsController < ApplicationController
  def authorize
    octo_client = Octokit::Client.new
    url = octo_client.authorize_url(github_configs['client_id'], :scope => github_configs['scope'], state:  github_configs['secret'])
    redirect_to url
  end

  def create
    client = Octokit.exchange_code_for_token(params[:code], github_configs['client_id'], github_configs['secret'])
    session[:access_token] = client[:access_token]
    redirect_to root_path
  end

  private

  def github_configs
    Rails.application.config_for('github')
  end
end
