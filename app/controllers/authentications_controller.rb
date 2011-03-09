class AuthenticationsController < ApplicationController
  def index
  end

  def create
	  omniauth = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])  
	  if authentication  
	    flash[:notice] = "Signed in successfully."  
	    sign_in(:user, authentication.user)
			redirect_to root_url  
	  elsif current_user  
	    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
	    flash[:notice] = "Authentication successful."  
	    redirect_to root_url  
	  else  
	    user = User.new
			user.name = omniauth["user_info"]["nickname"]
			user.token = omniauth["credentials"]['token']
			user.secret = omniauth["credentials"]["secret"]
	    user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])  
	    user.save!
	    flash[:notice] = "Signed in successfully."  
	    sign_in(:user, user)
			redirect_to root_url  
	  end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
