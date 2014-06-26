class AddPhotoAtributeToProductPromotion < ActiveRecord::Migration
	def self.up
	    change_table :product_promotions do |t|
      t.attachment :image
		end
	end

    def self.down
	    drop_attached_file :products, :image
    end
end
