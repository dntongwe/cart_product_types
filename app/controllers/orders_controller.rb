class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = current_cart.build_order(order_params)
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :ip_address, :first_name, :last_name, :card_expires_on, :card_number, :card_verification)
  end
end


