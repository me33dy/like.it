FactoryGirl.define do
	factory :product do
		name "product"
		requirement 1000
		reward "reward"
		description "hello product"
		#define a product's association with company for testing
		company
	end
end