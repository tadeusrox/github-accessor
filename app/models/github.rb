class Github
  def initialize(access_token)
    @access_token = access_token
  end

  def user
    return nil if @access_token.nil?
    @user ||= Octokit::Client.new(access_token: @access_token)
  end
end
