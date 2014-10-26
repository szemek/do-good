class Deed < ActiveRecord::Base
  has_many :likes, dependent: :delete_all
  has_many :reports, dependent: :delete_all

  validates :person, :action, presence: true

  paginates_per 25
  max_paginates_per 25
end
