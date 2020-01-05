class CartItemsController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])
  	@cart_item = current_cart.cart_items.create!(:product_id => @product.id, :unit_price => @product.price)
    flash[:notice] = "#{@product.name} added to cart"
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to current_cart_url
  end
end




