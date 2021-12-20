class AddBannedUsersColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :banned_users, :boolean, default: false
  end
end
