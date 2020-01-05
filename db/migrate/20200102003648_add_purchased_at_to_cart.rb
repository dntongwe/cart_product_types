class AddPurchasedAtToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :purchased_at, :datetime
  end
end
