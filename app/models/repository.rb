class Repository < ActiveRecord::Base
  belongs_to :user
  has_many :issues

  def list_issues

  end
end
