class CreateProductPromotions < ActiveRecord::Migration
  def change
    create_table :product_promotions do |t|
      t.integer :promoter_id, :null => false
      t.integer :promoting_product_id, :null => false

      t.timestamps
    end
    add_index :product_promotions, :promoter_id
    add_index :product_promotions, :promoting_product_id
    add_index :product_promotions, [:promoter_id, :promoting_product_id], unique: true, name: "index_promoter_and_promoting_product_on_promotion"
  end
end
