class ApiKeyToRealm < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys_apiv2_realms, id: false do |t|
      t.belongs_to :api_key, foreign_key: true, null: false
      t.belongs_to :realm, foreign_key: {to_table: :apiv2_realms}, null: false
    end
  end
end
