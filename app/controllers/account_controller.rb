class AccountController < ApplicationController
  def signup
    if request.post?
      @new_user = User.new(user_params)
      if @new_user.save
        redirect_to :action => :signin
        flash[:notice] = "Account Created Successfully! Please check your inbox."
        NotifierMailer.welcome_email(@new_user).deliver
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
        session[:user] = @user
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
    params.permit(:first_name,:last_name,:date_of_birth,:mobile,:email,:password,:hashed_password)
  end

  

end
