class RemoveImageStringToProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :image
  end
end
