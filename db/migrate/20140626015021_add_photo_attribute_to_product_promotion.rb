class AddPhotoAttributeToProductPromotion < ActiveRecord::Migration
  def self.up
    change_table :product_promotions do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :product_promotions, :image
  end
end
