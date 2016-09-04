class UsersController < ApplicationController

	# 9:00 AM
  def new
  end

  def create
  	user = User.new(user_params)
  	if user.save
  			session[:user_id] = user.id 
  			redirect_to '/'
  	else
  		# redirect_to '/signup'

  		render plain: "failure: new user not created"
  	end
  end


  private
  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation, :email)
  	end

end
