class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :stripe_token
      t.string :stripe_customer_id
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
