class ChargesController < ApplicationController
  def new
    if current_user.service == "Starter"
      @amount = 150_00
    elsif current_user.service == "Standard"
      @amount = 240_00
    elsif current_user.service == "Premium"
      @amount = 390_00
    end

    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "#{current_user.service} Package",
      amount: @amount
    }
  end

  def create
    if current_user.service == "Starter"
      @amount = 150_00
    elsif current_user.service == "Standard"
      @amount = 240_00
    elsif current_user.service == "Premium"
      @amount = 390_00
    end

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "#{current_user.service} Package  - #{current_user.name}",
      :currency    => "usd"
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
