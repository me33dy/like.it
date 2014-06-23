require 'rails_helper'

describe Product do

	# set user as an sample created by factory girl for testing
	let(:company) { FactoryGirl.create(:company) }

	# build an product from the user side to test the association
	before { @product = company.products.build(name: "product", requirement: 100, reward: "test", description: "hello product") }

	#ensure the @product is the one we are going to test on
	subject { @product }

	it { should respond_to(:name) }
	it { should respond_to(:requirement) }
	it { should respond_to(:reward) }
	it { should respond_to(:description) }
	it { should respond_to(:company_id) }
	its(:company) { should eq(company) }

	it { should be_valid }

	describe "when company_id is not present" do
		before { @product.company_id = nil }
		it { should_not be_valid }
	end

	describe "when name is not present" do
		before { @product.name = " " }
		it { should_not be_valid }
	end

	describe "when product name is too long" do
		before { @product.name = "a" * 51 }
		it { should_not be_valid }
	end

	#check reward requirement is present, can not be 0 nor greater than 1,000,000
	describe "when requirement is not present" do
		before { @product.requirement = nil }
		it { should_not be_valid }
	end

	describe "when requirement is 0" do
		before { @product.requirement = 0 }
		it { should_not be_valid }
	end

		describe "when requirement is too high" do
		before { @product.requirement = 1000001 }
		it { should_not be_valid }
	end

	describe "when reward is not present" do
		before { @product.reward = " " }
		it { should_not be_valid }
	end

	describe "when reward description is too long" do
		before { @product.reward = "a" * 51 }
		it { should_not be_valid }
	end


end
