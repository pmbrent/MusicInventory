class AddIndexToSessionToken < ActiveRecord::Migration
  def change
    add_index :users, :session_token, uniqueness: true
  end
end
