class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.json :image
      t.integer :growth_time
      t.integer :seed_from
      t.integer :seed_to
      t.timestamps
    end
  end
end
