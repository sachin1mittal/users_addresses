class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.boolean :active
      t.string :full_address
      t.timestamps null: false
    end
  end
end
