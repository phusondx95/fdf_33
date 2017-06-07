class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# log
      log_in user
      redirect_to user
  	else
  		# errors message
  	  flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
  end
end
