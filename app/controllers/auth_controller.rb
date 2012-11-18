require "httparty"

class AuthController < ApplicationController
  SINGLY_API_BASE = "https://api.singly.com"

  def callback
    auth_hash = request.env["omniauth.auth"]
    session[:access_token] = auth_hash.credentials.token
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if !@authorization
      @profiles = HTTParty.get(profiles_url, {
                  :query => {:access_token => session[:access_token]}
                }).parsed_response
      user = User.new :name => @profiles["data"]["first_name"], :email => @profiles["data"]["email"]
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      user.save
    end
    @user = user || User.find(@authorization[:user_id])
    session[:current_user] = @user.id
    if session[:return_to].nil? 
      session[:return_to] = '/'
    end
    redirect_to session[:return_to]
  end

  def logout
    session.clear
    redirect_to "/"
  end

  def index
    if user_logged_in? 
      redirect_to '/' and return
    end
  end

  private 

  def profiles_url
    "#{SINGLY_API_BASE}/profiles/facebook"
  end
end