class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  has_many :payments

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end
end
