class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,null: false,foreign_key: true
      t.string :post_code,null: false
      t.integer :shipping_area_id,null: false
      t.string :municipalities,null: false
      t.string :block_number,null: false
      t.string :building_name,null: true, default: nil
      t.string :phone_number,null: false

      t.timestamps
    end
  end
end
