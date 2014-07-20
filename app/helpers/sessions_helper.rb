module SessionsHelper

	def current_company
		@current_company ||= session[:remember_token] && Company.find(session[:remember_token])

	end

	def signed_in_company
    	unless !current_company.nil?
      		redirect_to sign_in_url, notice: "Please sign in."
      	end
    end
end
