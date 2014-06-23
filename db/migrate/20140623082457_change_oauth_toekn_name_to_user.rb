class ChangeOauthToeknNameToUser < ActiveRecord::Migration
  def change
  	rename_column :users, :oauth_toekn, :oauth_token
  end
end
