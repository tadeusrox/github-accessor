class PullRequest < ActiveRecord::Base
  belongs_to :user

  def populate_files
    n = 0
    loop do
      length = 0
      Rails.cache.fetch("#{cache_key}/repositories/pulls_files/#{repo}/#{pull_id}?page=#{n}", expires_in: 1.year) do
        files = user.github_user.pull_request_files(repo, pull_id, per_page: 100, page: n) rescue []
        files.each do |file|
          PullRequestFile.find_or_create_by(repository: repo, pull_id: pull_id, file_path: file.filename)
        end
        length = files.length
      end
      n = n + 1
      break if length != 100
    end
  end

  def files
    PullRequestFile.where(repository: repo, pull_id: pull_id)
  end

  def github_pull
    Rails.cache.fetch("#{cache_key}/pulls/#{repo}/#{pull_id}") do
      user.github_user.pull_request(repo, pull_id)
    end
  end
end
