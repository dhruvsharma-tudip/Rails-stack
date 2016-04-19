class UserMailer < ApplicationMailer
  default from: 'schoolsparrow@tudip.com'

  def set_password(user)
    @user = user
    mail(to: @user.email, subject: 'schoolsparrow.com customer account activated')
  end
end
