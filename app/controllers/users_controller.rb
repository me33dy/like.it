class UsersController < ApplicationController
  def index
  	@products = current_user.product_promotions.paginate(:page => params[:page], :per_page => 12)
  end

  def create
  end
end