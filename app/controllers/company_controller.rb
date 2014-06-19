class CompanyController < ApplicationController
		before_action :set_company, :only => [:show, :edit, :update, :destroy]
		respond_to :html, :json	
end

	

	def index
		@companies = Company.all.order("name desc")
		respond_with @companies

	end

	def new
		@company = Company.new
	end


  def create
    @company = Company.new(question_params)

    if @company.save
      respond_to do |format|
        format.html { redirect_to questions_path }
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
		respond_with @company
	end


	def edit
	end

	def update
		if @company.update(company_params)
			respond_to do |format|
				format.html { redirect_to companies_path}
				format.json { render nothing: true, status: :no_content}
		end
	else 
		respond_to do |format|
			format.html {render 'edit'}
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
	@question = Question.find(params[:id])
end

def company_params
	params.require(:company).permit(:name, :email, :url, :mission, :password, :password_confirmation)
end



end
