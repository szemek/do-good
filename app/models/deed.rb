class Deed < ActiveRecord::Base
  has_many :likes, dependent: :delete_all
  has_many :reports, dependent: :delete_all

  validates :person, :action, presence: true

  scope :grouped_by_day, -> {
    order(:created_at).group_by do |deed|
      deed.created_at.beginning_of_day.to_i.in_milliseconds
    end
  }
end
