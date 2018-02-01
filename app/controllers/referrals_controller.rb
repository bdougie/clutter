class ReferralsController < ApplicationController

  def index
  end

  def refer_user 
    UserMailer.referral_email(current_user, referral_params).deliver
    flash[:notice] = "You have successfully referred #{referral_params[:name]} to join Clutter!"
    redirect_to root_path
  end

  private

  def referral_params
    params.permit(:name, :email)
  end

end