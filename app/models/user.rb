class User < ActiveRecord::Base
  attr_accessor :github_user

  has_many :repositories

  def list_repositories
    github_repositories.each do |repo|
      repositories.find_or_create_by(full_name: repo.full_name)
    end
    repositories
  end

  def github_repositories
    Rails.cache.fetch("#{cache_key}/repositories", expires_in: 1.year) do
      github_user.repositories
    end
  end
end
