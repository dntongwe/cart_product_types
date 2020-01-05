class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
