require 'rails_helper'

describe Company do
	before { @company = Company.new(name: "test", email: "test@test.com", url: "test_url.com", mission: "hello world", password: "password", password_confirmation: "password")}

	subject { @company }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:url) }
	it { should respond_to(:mission) }

	#the password, password_digest, password_confirmation, and salt for authentication
	it { should respond_to(:password) }
	it { should respond_to(:salt) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password_confirmation) }
	# respond to relationship with products
	it {should respond_to(:products) }



	it { should be_valid }

	#check must have a name presence to be valid
	describe "when name is not present" do
		before { @company.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
	before { @company.name = "a" * 51 }
	it { should_not be_valid }
	end

	#check must have the email present to be valid 
	describe "when email is not present" do
		before { @company.email = " " }
		it { should_not be_valid }
	end


	#check email must in correct format to be valid 
	describe "when email format is invalid" do
	it "should be invalid" do
	  addresses = %w[company@sample,com test_at_sample.org example.test@sample.
	   sample@efr+ede.com sample@efr..com]
	  addresses.each do |invalid_address|
	    @company.email = invalid_address
	    expect(@company).not_to be_valid
	  end
	end
	end

	#check email is in incorrect format should be not valid
	describe "when email format is valid" do
	it "should be valid" do
	  addresses = %w[company@sample.COM A_US-ER@f.b.org frst.lst@sample.de a+b@ede.jp]
	  addresses.each do |valid_address|
	    @company.email = valid_address
	    expect(@company).to be_valid
	  end
	end
	end

	#check the email must be unique in the database to be valid
	describe "when email address is already taken" do
	before do
	  company_with_same_email = @company.dup
	  company_with_same_email.email = @company.email.upcase
	  company_with_same_email.save
	end

	it { should_not be_valid }
	end

	#testing password field must be present
	describe "when password field is empty" do
		no_password_company = Company.new(name: "test", email: "test@test.com", url: "test_url.com", mission: "hello world", password: " ", password_confirmation: " ")
		it "should not be valid" do
		expect(no_password_company).to be_invalid
		end
	end

	# test password length must belonger than 6 characters
	describe "when password is too short" do
		short_password_company = Company.new(name: "test", email: "test@test.com", url: "test_url.com", mission: "hello world", password: "short", password_confirmation: "short")
		it "should not be valid" do
		expect(short_password_company).to be_invalid
		end
	end

	describe "when password and confirmation do not match" do
		before { @company.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end
	
	# describe "account authenticate method" do
 #    end











end
