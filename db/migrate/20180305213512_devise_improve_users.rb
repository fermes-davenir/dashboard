class DeviseImproveUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname,  :string
    add_column :users, :birthdate, :date
    add_column :users, :admin,     :boolean, null: false, default: false
  end
end
