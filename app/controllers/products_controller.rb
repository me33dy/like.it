class ProductsController < ApplicationController
    respond_to :html, :json 
    


  def index
    @products = Product.paginate(:page => params[:page], :per_page => 12)
    respond_with @products 
  end

  def new
@product = current_company.products.new
  end


  def create
      @product = current_company.products.new(product_params)
    if @product.save
      respond_to do |format|
        format.html { redirect_to current_company }
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
  @product = current_company.products.find(params[:id])
end

def product_params
  params.require(:product).permit(:name, :requirement, :reward, :description, :company_id, :image)
end

    def correct_company
      @products = current_company.products.find_by(id: params[:id])
      redirect_to root_url if @products.nil?
    end



end
