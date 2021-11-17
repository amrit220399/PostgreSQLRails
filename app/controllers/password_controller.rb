class PasswordController < ApplicationController
  def forgot
    if request.post?
      @user = User.find_by_email(params[:email])
      if @user
        new_password = random_password
        User.update(:password => new_password)
      end
    end
  end

  def random_password
  
  end

end
