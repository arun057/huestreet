class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_logged_in?
  	return session[:current_user] ? session[:current_user] : false
  end

  def authenticate_user
  	# raise request.env['REQUEST_URI'].inspect 
  	if !user_logged_in?
  		session[:return_to] ||= request.env['REQUEST_URI']
  		redirect_to '/login'
  	end
  end
end
