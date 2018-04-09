class CreatePlanifications < ActiveRecord::Migration[5.1]
  def change
    create_table :planifications do |t|
      t.integer :year
      t.references :user, foreign_key: true
      t.references :possibility, foreign_key: true

      t.timestamps
    end
  end
end
