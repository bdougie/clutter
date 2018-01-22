class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end
end
