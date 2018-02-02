class RegistrationsController < Devise::RegistrationsController

  def edit
    # if :query
    #   resource.service = :query
    # end
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
                                 :phone_number, :street_address, :city, :state, :zip, :service,
                                 :appointment, :second_appointment, :third_appointment)
  end

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

end