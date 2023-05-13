class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,null: false
      t.text :description,null: false
      t.integer :genre_id,null: false
      t.integer :item_condition_id,null: false
      t.integer :shipping_fee_payer_id,null: false
      t.integer :shipping_area_id,null: false
      t.integer :shipping_day_id,null: false
      t.integer :price,null: false
      t.references :user, null: false,foreign_key: true

      t.timestamps
    end
  end
end
