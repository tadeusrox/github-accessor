class AddTitleAndUrlToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :title, :string
    add_column :pull_requests, :url, :string
  end
end
