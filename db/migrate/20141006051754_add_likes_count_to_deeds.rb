class AddLikesCountToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :likes_count, :integer, default: 0
  end
end
