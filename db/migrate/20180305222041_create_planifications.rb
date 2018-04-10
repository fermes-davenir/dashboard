class CreatePlanifications < ActiveRecord::Migration[5.1]
  def change
    create_table :planifications do |t|
      t.integer :year
      t.integer :seed_week
      
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true
      t.timestamps
    end
  end
end
