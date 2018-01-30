class CreateApiPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string   "name",                        null: false
      t.string   "contact_email",               null: false
      t.timestamp "archived_at"
      t.timestamps
    end
    add_index(:partners, :created_at)
    add_index(:partners, :updated_at)
    add_index(:partners, :archived_at)
  end
end
