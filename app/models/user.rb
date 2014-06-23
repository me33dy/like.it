class User < ActiveRecord::Base
	has_many :product_promotions, foreign_key: "promoter_id"
	has_many :promoting_products, through: :product_promotions
end
