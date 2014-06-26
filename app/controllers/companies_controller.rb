class CompaniesController < ApplicationController
		before_action :set_company, :only => [:show, :edit, :update, :destroy]
		respond_to :html, :json	


	

	def index
		@companies = Company.all.order("name desc")
		respond_with @companies

	end

	def new
		@company = Company.new
	end


  def create
    @company = Company.new(company_params)

    if @company.save
    	@current_company = @company
      	respond_to do |format|
        format.html { redirect_to @company }
        format.json { render json: @company, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
		@company = Company.find(params[:id])

	end


	def edit

	end

	def update
		if @company.update(company_params)
			respond_to do |format|
				format.html { redirect_to @company}
				format.json { render nothing: true, status: :no_content}
		end
	else 
		respond_to do |format|
			format.html {render 'new'}
			format.json {render json: @company.errors, status: :unprocessable_entity}
			end
		end
	end


	def destroy
		@company.destroy

		respond_to do |format|
			format.html {redirect_to company}
			format.json { render json: { head: :ok }}
		end
	end
	

protected

def set_company
	@company = Company.find(params[:id])
end

def company_params
	params.require(:company).permit(:name, :email, :url, :mission, :password, :password_confirmation, :image)
end



end
