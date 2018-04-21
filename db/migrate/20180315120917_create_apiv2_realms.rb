# frozen_string_literal: true

# Realms alias for Partners, Servers, etc.
class CreateApiv2Realms < ActiveRecord::Migration[5.1]
  def change
    create_table :apiv2_realms do |t|
      t.string :name
      t.string :email
      t.text :description
      t.timestamps
    end
  end
end
