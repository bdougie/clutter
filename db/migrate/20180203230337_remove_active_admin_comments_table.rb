class RemoveActiveAdminCommentsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :active_admin_comments
  end
end