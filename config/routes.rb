Rails.application.routes.draw do

  get 'welcome/index'
  post '/oauth/strava' => "oauth#create"

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'clients/new'
  get 'clients/create'
  get 'clients/destroy'

  root 'welcome#index'

  resources :bikes, except: [:new, :edit]
  resources :parts, except: [:new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
