class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	# Test if user exists and the password is correct (authenticate)
  	if user && user.authenticate(params[:password])
  		# Save user id into cokkie
  		session[:user_id] = user.id 
  		redirect_to '/'
  	else
  		redirect_to '/login'
  		# render plain: ["login failed", user]
  	end

  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/login'

  end


  def error
  	render inline: "<h1 style='color:red;'> This has caused an error. Most likely the page does not exist</h1> <br /> <%= link_to 'Home', '/'%>"
  end
  
end
