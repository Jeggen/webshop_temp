Rails.application.routes.draw do
  devise_for :users,
    :path => '/', :path_names => {
      :sign_in => "inloggen", :sign_out => "outloggen", :sign_up => "registreer" },
      :controllers => {
        :sessions => :sessions,
        :passwords => :passwords}

  devise_scope :user do
    get '/inloggen', to: 'devise/sessions#new'
    get '/wachtwoord/vergeten', to: 'devise/passwords#new', as: '/wachtwoord/vergeten'
    get '/inloggegevens/wijzigen', to: 'users#edit'
  end

  namespace :admin do
    resources :products, path: 'producten'
    resources :categories
    resources :users
  end

  resources :shipping_addresses
  resources :invoice_addresses
  resources :profiles

  get '/producten', to: 'products#index', as: 'producten'

  root 'products#index'
end
