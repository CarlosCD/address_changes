class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.string  :ip_address,     null: false, default: ''
      t.integer :times_received, null: false, default: 0
      t.boolean :email_sent,     null: false, default: false
      t.timestamps null: false
    end
  end
end
