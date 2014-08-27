class AddHappinessToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :happiness, :integer, null: false, default: 3
  end
end
