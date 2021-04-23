class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_coad,      null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :street,           null: false
      t.string :build          
      t.string :phone_number,     null: false
      t.references :orders,       null: false, foreign_key: true
      t.timestamps
    end
  end
end