class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Clutter')
  end

  def referral_email(from, to)
    @user = from
    @referral_name = to[:name]
    mail(to: to[:email], subject: "You have been referred by '#{@user.name}' to join Clutter")
  end
end