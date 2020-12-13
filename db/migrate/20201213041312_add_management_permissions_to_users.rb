class AddManagementPermissionsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :management_permissions, :boolean, default: false, null: false
  end
end
