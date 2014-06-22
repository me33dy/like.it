require 'rails_helper'

describe "CompaniesPages" do
	subject { page }

	describe "Sign up page for companies" do 
		before { visit sign_up_path }
		it { should have_content("Sign Up") }
	end

	describe "sign up" do
		before { visit sign_up_path }

		let(:submit) { "Create Company" }

		describe "with incalid information" do
			it "should not create a new company" do
				expect { click_button submit }.not_to change(Company, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "company_name", with: "company"
				fill_in "company_email", with: "company@sample.com"
				fill_in "company_password", with: "password"
				fill_in "company_password_confirmation", with: "password"
			end

			it "should create a new company" do
				expect { click_button submit}.to change(Company, :count)
			end
		end
	end







end
