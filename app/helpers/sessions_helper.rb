module SessionsHelper
	def current_company
		@current_company ||= cookies[:remember_token] && User.find(cookies[:remember_token])
	end
end
