class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end

  def before_first_session
    if (self.appointment == (Time.zone.now - 48.hours))
      UserMailer.first_session_email(self).deliver
    end
  end

  def before_second_session
    if (self.second_appointment == (Time.zone.now - 48.hours))
      UserMailer.second_session_email(self).deliver
    end
  end

  def before_third_session
    if (self.third_appointment == (Time.zone.now - 48.hours))
      UserMailer.third_session_email(self).deliver
    end
  end
end
