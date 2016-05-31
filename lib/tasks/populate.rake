namespace :populate do
  desc "TODO"
  task files: :environment do
    client = Octokit::Client.new(:login => 'tadeusrox', :password => 'vinicius10')
    repositories = client.repositories(nil, per_page: 100)
    repositories.each do |repo|
      puts repo.full_name

        pull_requests = client.pull_requests(repo.full_name, state: 'all', per_page: 100) rescue []

        pull_requests.each do |pull|
          puts pull.number
          files = client.pull_request_files(repo.full_name, pull.number, per_page: 100) rescue []

          files.each do |file|
            puts file.filename
            PullRequestFile.find_or_create_by(repository: repo.full_name, pull_id: pull.number, file_path: file.filename)
          end
        end
    end
  end
end
