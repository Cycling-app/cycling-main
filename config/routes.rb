Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

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


end
