# http://localhost:3000/rails/mailers/user_mailer/welcome_email

class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end

  def referral_email
    UserMailer.referral_email(User.first, {name: 'Lauren Cattano', email: 'lauren.cattano@gmail.com'})
  end

  def first_session_email
    UserMailer.first_session_email(User.first)
  end

  def second_session_email
    UserMailer.second_session_email(User.first)
  end

  def third_session_email
    UserMailer.third_session_email(User.first)
  end
end