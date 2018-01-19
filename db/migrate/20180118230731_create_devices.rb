class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :serial_number, null: false
      t.string :firmware,      null: false
      t.timestamps null: false
    end
    add_index :devices, :serial_number, unique: true
  end
end
