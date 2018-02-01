Rails.application.routes.draw do

  get 'approach', to: 'approach#index'

  get 'services', to: 'services#index'

  get 'referrals', to: 'referrals#index'

  post 'refer_user', to: 'referrals#refer_user'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'welcome#index'

end