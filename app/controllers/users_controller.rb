class UsersController < ApplicationController
  def index
  	@products = current_user.product_promotions
  end

  def create

  end
end