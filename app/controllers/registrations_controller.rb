class RegistrationsController < Devise::RegistrationsController

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
end