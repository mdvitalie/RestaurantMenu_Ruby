class AddStatusToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :status, :string
  end
end
