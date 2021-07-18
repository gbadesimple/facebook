class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_mail.subject
  #
  def welcome_mail(user)
    @user = user
    @mail = "We noticed your presence as a new member of our platform, please feel free to navigate around, make friends and have some fun with other members."
    @subject = "Welcome to facebook"
    @url = "https://www.facebook.com"
    @powered = "This is a task from TheOdinProjectCurriculum powered by @codetech.inc"

    mail(to: @user.email, subject: @subject)
  end
end
