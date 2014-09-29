class Deed < ActiveRecord::Base
  validates :person, :action, presence: true

  scope :grouped_by_day, -> {
    order('created_at DESC').group_by{|deed| deed.created_at.beginning_of_day}
  }
end
