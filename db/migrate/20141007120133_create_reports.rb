class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :deed_id
      t.string :ip

      t.timestamps
    end
  end
end
