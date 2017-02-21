class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
    remove_column :users, :provider
    remove_column :users, :uid
  end
end
