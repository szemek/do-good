class Like < ActiveRecord::Base
  belongs_to :deed, counter_cache: true
end
