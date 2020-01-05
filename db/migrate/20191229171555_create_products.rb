class CreateProducts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.datetime :released_at
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
