class ChangeCompanyIdToNullToProduct < ActiveRecord::Migration
  def change
  	change_column_null :products, :company_id, true
  end
end
