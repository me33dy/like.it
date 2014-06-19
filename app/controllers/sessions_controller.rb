class SessionsController < ApplicationController
  def new
  end

  def create
  	@company = Company.find_by(email: params[:session][:email]).first
  	if @company && @company.authenticate(params[:session][:email]) 
  		session[:remember_token] = @company.id
  		@current_user = @user
  		redirect_to '#'
  	else
  		render 'new'
  	end
  end

  def destroy
  	session.delete(:remember_token)
  	redirect_to 'root'
  end
end
