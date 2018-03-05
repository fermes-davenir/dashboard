class CreatePossibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :possibilities do |t|
      t.integer :nursery_time
      t.integer :seed_week
      t.integer :harvest_week
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
