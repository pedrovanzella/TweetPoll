class AuthenticationsController < ApplicationController
  def index
  end

  def create
	  render :text => request.env["omniauth.auth"]["uid"]
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
