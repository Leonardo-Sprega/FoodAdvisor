class ApplicationController < ActionController::Base
    before_action :set_current_user
	
	protected
	def set_current_user

		if session[:user_id]
			Current.user = Utente.find_by(id: session[:user_id])
		end
		 
		# we exploit the fact that the below query may return nil
		# @current_user = Utente.where(:id => 2).first
		# redirect_to ristorantes_path and return unless @current_user
		
	end

	helper_method :logged_in?, :current_user

	def current_user
		if session[:user_id]
		@user = Utente.find(session[:user_id])
		end
	end

	def logged_in?
		!!current_user
	end

	def authorized
		#redirect_to login_path unless logged_in?
  	end
end
