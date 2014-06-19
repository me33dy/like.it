class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.integer :requirement, :null => false
      t.string :reward, :null => false
      t.string :description
      t.references :company, index: true

      t.timestamps
    end
  end
end
