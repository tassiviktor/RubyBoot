class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :key, nullable: false
      t.text :ip_whitelist
      t.text :ip_blacklist
      t.boolean :is_master_key, default: false
      t.string :key_description
      t.timestamps
    end
    add_index :api_keys, :key, unique: true
  end
end
