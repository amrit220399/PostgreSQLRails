class NotifierMailer < ApplicationMailer
    
    def welcome_email(user)
        @user = user
        @url  = 'localhost:3000/account/login'
        mail(to: @user.email, subject: 'Welcome to PostgreSQL App')
      end

end
