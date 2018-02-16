Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)

  get 'approach', to: 'approach#index'

  get 'services', to: 'services#index'

  get 'referrals', to: 'referrals#index'
  post 'refer_user', to: 'referrals#refer_user'

  get 'new_charge', to: 'payments#new'
  post 'charges', to: 'payments#create'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'welcome#index'

end