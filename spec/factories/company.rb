#set up factory girl to generate sample company quicky for testing
FactoryGirl.define do
	factory :company do

		#use sequence to generate unique values for testing
		sequence(:name) { |n| "name#{n}" }
		sequence(:email) {|n| "email#{n}@sample.com" }
		url "http://sample.com"
		mission "hello world"
		password "password"
		password_confirmation { |u| u.password }
	end
end