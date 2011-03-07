class AuthenticationsController < ApplicationController
  def index
  end

  def create
	  omniauth = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])  
	  if authentication  
	    flash[:notice] = "Signed in successfully."  
	    sign_in_and_redirect(:user, authentication.user)  
	  elsif current_user  
	    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
	    flash[:notice] = "Authentication successful."  
	    redirect_to authentications_url  
	  else  
	    user = User.new
			user.name = omniauth["user_info"]["nickname"]
	    user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])  
	    user.save!
	    flash[:notice] = "Signed in successfully."  
	    sign_in_and_redirect(:user, user)  
	  end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
