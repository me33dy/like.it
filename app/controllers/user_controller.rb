class UserController < ApplicationController
  def index
  	@products = current_user.promoting_products
  end
end
