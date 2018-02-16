ActiveAdmin.register Payment do
  permit_params :user_id, :amount, :package, :stripe_token, :stripe_customer_id

  index do
    selectable_column
    id_column
    column :user_id
    column :amount
    column :package
    column :stripe_token
    column :stripe_customer_id
    actions
  end
end