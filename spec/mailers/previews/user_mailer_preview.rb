class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end

  def referral_email
    UserMailer.referral_email(User.first, {name: 'Lauren Cattano', email: 'lauren.cattano@gmail.com'})
  end
end