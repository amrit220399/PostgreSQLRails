class AccountController < ApplicationController
  
  
  def signup
    @user = User.new
    if request.post?
      @user = User.new(user_params)
      puts @user.inspect
      puts "======================"
      if @user.save
        redirect_to :action => :signin
        flash[:notice] = "Account Created Successfully! Please check your inbox."
        NotifierMailer.welcome_email(@user).deliver
      else
        render :action => :signup
      end
    end
  end

  def signin
    if request.post?
      @user = User.authenticate(params[:email],params[:password])
      if @user
        redirect_to :controller => :home ,:action => :index
        flash[:notice] = "Logged In as "  + @user.email
        session[:user] = @user.id
      
      else
        flash[:notice] = "Invalid Email/Password"
        redirect_to  :action => :signin
      end
    end
  end

  def signout
    session[:user] = nil
    flash[:notice] = "Logged Out Successfully!"
    redirect_to :action => :signin
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:date_of_birth,:mobile,:email,:password,:hashed_password)
  end

  

end
