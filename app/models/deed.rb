class Deed < ActiveRecord::Base
  validates :person, :action, presence: true
end
