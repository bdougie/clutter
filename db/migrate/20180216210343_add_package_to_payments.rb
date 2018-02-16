class AddPackageToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :package, :string
  end
end
