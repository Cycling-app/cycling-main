Rails.application.routes.draw do
  get 'welcome/index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'clients/new'
  get 'clients/create'
  get 'clients/destroy'

  root 'welcome#index'

  resources :bikes
  resources :parts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
