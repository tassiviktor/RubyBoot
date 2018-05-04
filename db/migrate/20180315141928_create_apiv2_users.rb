# frozen_string_literal: true

# Users
class CreateApiv2Users < ActiveRecord::Migration[5.1]
  def change
    create_table :apiv2_users do |t|
      t.belongs_to :realm, foreign_key: {to_table: :apiv2_realms}, null: false
      t.boolean :admin, null: false, default: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_hash
      t.string :password_reset_token
      t.timestamp :reset_password_sent_at
      t.timestamp :confirmation_sent_at
      t.string :confirmation_token
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.timestamps
    end
  end
end
