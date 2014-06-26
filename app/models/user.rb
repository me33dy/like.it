class User < ActiveRecord::Base
	has_many :product_promotions, foreign_key: "promoter_id"
	has_many :promoting_products, through: :product_promotions
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
		user.provider = auth.provider
		user.uid = auth.uid
		user.name = auth.info.name
		user.oauth_token = auth.credentials.token
		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		user.save!
    	end
  	end

	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end

end
