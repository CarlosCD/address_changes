class AddEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enabled, :boolean, default: true, null: false
    add_index :users, :enabled
  end
end
