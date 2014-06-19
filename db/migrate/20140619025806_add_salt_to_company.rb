class AddSaltToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :salt, :string
  end
end
