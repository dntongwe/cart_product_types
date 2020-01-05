class ApplicationController < ActionController::Base
before_action :current_cart, :set_locale
#filter_parameter_logging :card_number, :card_verification

private

	def current_cart
	  @current_cart ||= Cart.first || Cart.create!
	end

	def set_locale
	  I18n.locale = params[:locale] if params[:locale].present?
	  # current_user.locale
	  # request.subdomain
	  # request.env["HTTP_ACCEPT_LANGUAGE"]
	  # request.remote_ip
	end

	def default_url_options(options = {})
	  {locale: I18n.locale}
	end

	def current_cart
	  if session[:cart_id]
	    @current_cart ||= Cart.find(session[:cart_id])
	    session[:cart_id] = nil if @current_cart.purchased_at
	  end
	  if session[:cart_id].nil?
	    @current_cart = Cart.create!
	    session[:cart_id] = @current_cart.id
	  end
	  @current_cart
	end

end
