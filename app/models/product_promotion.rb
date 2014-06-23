class ProductPromotion < ActiveRecord::Base
	belongs_to :promoter, class_name: "User", foreign_key: "promoter_id"
	belongs_to :promoting_product, class_name: "Product", foreign_key: "promoting_product_id"
end
