class VikingMailer < ApplicationMailer
  default from: 'bloodyvikings@breakfast.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Do you have any spam?')
  end
end
