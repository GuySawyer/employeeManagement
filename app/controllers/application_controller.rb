class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  USER, PASSWORD = 'admin', 'secret'
	before_filter :authentication_check, :except => :index

	private
	  def authentication_check
	   authenticate_or_request_with_http_basic do |user, password|
	    user == USER && password == PASSWORD
	   end
	  end
end
