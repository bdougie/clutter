class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end

  def before_first_session
    UserMailer.first_session_email(self).deliver
  end

  def before_second_session
    UserMailer.second_session_email(self).deliver
  end

  def before_third_session
    UserMailer.third_session_email(self).deliver
  end
end
