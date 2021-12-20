class AddRolesMaskToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :visitor, :boolean, default: false
  end
end
