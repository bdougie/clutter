Rails.application.routes.draw do

  get 'service-agreement', to: 'service_agreement#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'welcome#index'
      
end
