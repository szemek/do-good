class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :deed_id
      t.string :ip

      t.timestamps
    end
  end
end
