class ProfileController < ApplicationController
  def edit
    @curr_user = User.find(session[:user])

    if request.post?
      @curr_user.update(:first_name=> params[:first_name],:last_name=> params[:last_name],:mobile=> params[:mobile],:date_of_birth=> params[:date_of_birth],:avatar => params[:avatar],:password=> params[:password])
      puts @curr_user.errors.inspect
      redirect_to :action=>:edit
    end
  end
end
