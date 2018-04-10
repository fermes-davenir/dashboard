class AddDetailsToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :description, :text, null: true
    add_column :plants, :tip, :text, null: true
    add_column :plants, :more_link, :string
  end
end
