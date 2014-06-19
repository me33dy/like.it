require 'rails_helper'

describe Company do
	before { @company = Company.new(name: "test", email: "test@test.com", url: "test_url.com", mission: "hello world")}

	subject { @company }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:url) }
	it { should respond_to(:mission) }

	it { should be_valid }











end
