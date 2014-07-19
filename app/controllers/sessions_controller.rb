class SessionsController < ApplicationController
  def new
    
  end

  def create 
  	@company = Company.find_by(email: params[:session][:email])
  	if @company && @company.authenticate(params[:session][:password]) 
  		session[:remember_token] = @company.id.to_s
  		@current_company = @company
  		redirect_to @company
  	else
  		render 'new'
  	end
  end

  def destroy
    # reset_session
  	session.delete(:remember_token)
  	redirect_to root_path
  end
end

