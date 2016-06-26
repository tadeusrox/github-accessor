class PullRequestFile < ActiveRecord::Base
  def find_similar
    self.class.where(repository: repository, file_path: file_path).where.not(pull_id: pull_id)
  end

  def pull_request
    PullRequest.find_by(pull_id: pull_id, repo: repository)
  end
end
