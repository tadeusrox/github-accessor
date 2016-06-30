class PullRequestsController < ApplicationController
  def show
    @pull_request = system_user.best_pull_request
  end
end
