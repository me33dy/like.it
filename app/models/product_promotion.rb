class ProductPromotion < ActiveRecord::Base
	belongs_to :promoter, class_name: "User", foreign_key: "promoter_id"
	belongs_to :promoting_product, class_name: "Product", foreign_key: "promoting_product_id"
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
