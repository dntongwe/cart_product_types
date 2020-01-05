class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  before_create :default_quantity_to_one
  
  def full_price
    self.unit_price * quantity
  end
  
  private
  
  def default_quantity_to_one
    self.quantity ||= 1
  end

end
