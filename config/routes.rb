Rails.application.routes.draw do

  get 'approach', to: 'approach#index'

  get 'services', to: 'services#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'welcome#index'

end