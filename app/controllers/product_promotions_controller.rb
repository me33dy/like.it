class ProductPromotionsController < ApplicationController
  def create
  	@product = Product.find(params[:product_promotion][:promoting_product_id])
  	@user = current_user
  	@product.promote_this!(@user)
  	redirect_to users_path
  end

  def destroy
    @product = ProductPromotion.find(params[:id])
    @product.destroy
    redirect_to users_path
  end

  private
  def promotion_params
  	params.require(:product_promotion).permit(:promoter_id, :promoting_product_id)
  end
end
