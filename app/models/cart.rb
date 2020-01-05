class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, :through => :cart_items
  has_one :order
	
	def total_price
		cart_items.to_a.sum(&:full_price)
	end

def paypal_url(return_url, notify_url)
  values = {
    :business => 'sb-n9vvk38491@business.example.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  cart_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.unit_price,
      "item_name_#{index+1}" => item.product.name,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end

end





