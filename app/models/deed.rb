class Deed < ActiveRecord::Base
  has_many :likes, dependent: :delete_all
  has_many :reports, dependent: :delete_all

  validates :person, :action, presence: true

  paginates_per 25
  max_paginates_per 25

  before_save :truncate_action

  def truncate_action
    self.action = self.action.slice(0...1000)
  end
end
