class ChangePasswordDigestCOlumnNullToCompany < ActiveRecord::Migration
  def change
  	change_column_null :companies, :password_digest, false
  	change_column_null :companies, :salt, false

  end
end
