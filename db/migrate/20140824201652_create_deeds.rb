class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.string :person, null: false
      t.text :action, null: false

      t.timestamps
    end
  end
end
