class ChangeCompanyRefNullToProduct < ActiveRecord::Migration
  def change
  	change_column_null :products, :company_id, false
  end
end
