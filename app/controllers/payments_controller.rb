class PaymentsController < ApplicationController

  def new
    # @stripe_btn_data = {
    #   key: "#{ Rails.configuration.stripe[:publishable_key] }",
    #   description: "BigMoney Membership - #{current_user.name}",
    #   amount: amount
    # }
  end

  def create
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => "#{current_user.name} - #{current_user.service} Package",
      :currency    => "usd"
    )

    Payment.create(
      :stripe_token       => params[:stripeToken],
      :stripe_customer_id => charge.customer,
      :user_id            => current_user.id,
      :amount             => charge.amount / 100,
      :package            => current_user.service
    )

    flash[:notice] = "Your payment of $#{amount / 100} for the Clutter #{current_user.service} Package has been successfully completed. Thank you!"
    redirect_to edit_user_registration_path(current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private 

  def amount
    if current_user.service == "Starter"
      return 150_00
    elsif current_user.service == "Standard"
      return 280_00
    elsif current_user.service == "Premium"
      return 390_00
    end
  end
end