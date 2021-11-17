class NotifierMailer < ApplicationMailer
    
    def welcome_email(user)
        @user = user
        @url  = 'localhost:3000/account/login'
        mail(to: @user.email, subject: 'Welcome to PostgreSQL App')
      end

    def random_password_send(user,password)
        @user = user
        @url  = 'localhost:3000/account/login'
        @password = password
        mail(:to => (user.email), :subject => "Your Temproary password for PGSQL App...")
    end
    
    def reset_password_confirmation(user)
      @user = user
      mail(:to => (user.email), :subject => "Your password has been reset...")
    end
    
end
