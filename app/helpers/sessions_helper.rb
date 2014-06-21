module SessionsHelper
	def current_company
		@current_company ||= session[:remember_token] && User.find(session[:remember_token])
	end
end
