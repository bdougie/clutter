class AddServiceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :service, :string
  end
end
