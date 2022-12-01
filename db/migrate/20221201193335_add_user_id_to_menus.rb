class AddUserIdToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :user_id, :integer
    add_index :menus, :user_id
  end
end
