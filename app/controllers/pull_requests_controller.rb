class PullRequestsController < ApplicationController
  def show
    @pull_request = system_user.pull_requests.where(checked: false).find(params[:id])
  end
end
