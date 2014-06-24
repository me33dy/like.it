class ProductsController < ApplicationController
  before_action :set_product, :only => [:show, :edit, :update, :destroy]
    respond_to :html, :json 


  def index
    @products = Product.all
    respond_with @products 
  end

  def new
    @product = Company.first.products.build
  end


  def create
    @product = Company.first.products.new(product_params)
    if @product.save
      respond_to do |format|
        format.html { redirect_to products_path }
        format.json { render json: @product, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_with @product
  end


  def edit
  end

  def update

    if @product.update(product_params)
        respond_to do |format|
          format.html { redirect_to products_path}
          format.json { render nothing: true, status: :no_content}
        end
    else 
      respond_to do |format|
        format.html {render 'edit'}
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end


  def destroy

    @product.destroy

    respond_to do |format|
      format.html {redirect_to product}
      format.json { render json: { head: :ok }}
    end
  end
  

protected

def set_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit(:name, :requirement, :reward, :description, :company_id)
end



end
