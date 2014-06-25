class ProductPromotionsController < ApplicationController
  def create
  	@product = Product.find(params[:product_promotions][:promoting_product_id])
  	@user = current_user
  	@product.promote_this!(@user)
  	redirect_to @user
  end

  def destroy
  end

  private
  def promotion_params
  	params.require(:product_promotions).permit(:promoter_id, :promoting_product_id)
  end
end
