require "rubygems"
require "active_merchant"

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "sb-n9vvk38491_api1.business.example.com",
  :password => "CPM5VHQ9P5GKF73S",
  :signature => "A.EbtEvsNVLqVoZ5GoGqjafLbbX4A20d3U7qb-degfLY6YX-9x6uArnL" 

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :type               => "visa",
  :number             => "4024007148673576",
  :verification_value => "123",
  :month              => 1,
  :year               => Time.now.year+1,
  :first_name         => "Dieudonne",
  :last_name          => "Ntongwe"
)

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end

4159443744379200
10/2023
656