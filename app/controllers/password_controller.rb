class PasswordController < ApplicationController
  
  def forgot
    if request.post?
			@user = User.find_by_email(params[:email])
			if @user
			   new_password = random_password
         puts new_password
         puts "===================="
			   @user.update(:password=>new_password)
			   puts @user.errors.inspect
				NotifierMailer.random_password_send(@user,new_password).deliver
				flash[:notice] = "A new password has been sent to your email"
			   redirect_to :controller => "account", :action=>"signin"
			else
			   flash[:notice]="Invalid Email.Please enter correct email"
			   redirect_to  :action=>"forgot"
			end
		
		end
  end

  def random_password
    (0...8).map{65.+(rand(25)).chr}.join
  end

  def reset
    @user = User.find(session[:user])
  
		if request.post?			
			if @user
			@user.update(:password=>params[:password])
      puts @user.inspect
      puts params[:password]
			NotifierMailer.reset_password_confirmation(@user).deliver
			flash[:notice] = "Your password has been reset"
			redirect_to :controller=> :home ,:action=> :index
			else
        flash[:notice] = "Something went wrong..."
				redirect_to  :action=>:reset
			end
		end
  end

end
