class ProductPromotionsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 12)
  end
  def create

  	@product = Product.find(params[:product_promotion][:promoting_product_id])
  	@user = current_user
  	@product.promote_this!(@user)
  	redirect_to users_path
  end

  def update
    @product = ProductPromotion.find(params[:id])
    if @product.update(promotion_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def promotion_params
  	params.require(:product_promotion).permit(:promoter_id, :promoting_product_id,:image)
  end
end
