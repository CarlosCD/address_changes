class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.decimal :temperature, precision: 5, scale: 2
      t.decimal :air_humidity, precision: 5, scale: 2
      t.integer :co_level
      t.string :device_health
      t.boolean :co_alert, default: false, null: false
      t.references :device, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
