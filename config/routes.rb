Rails.application.routes.draw do

    devise_for :users
    
    get 'about' => 'welcome#about'

    root 'welcome#index'
    
end
