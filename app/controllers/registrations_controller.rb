class RegistrationsController < Devise::RegistrationsController

  def refer_user 
    UserMailer.referral_email(resource, params)
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_resource(resource, params)
    params.delete :current_password
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password,
                                 :phone_number, :street_address, :city, :state, :zip, :appointment)
  end

  def refer_user 
    params.require(:user).permit(:name, :email)
  end
end