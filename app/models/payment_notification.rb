class PaymentNotification < ActiveRecord::Base
	belongs_to :cart

	def create
	  PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
	  render :nothing => true
	end
end
