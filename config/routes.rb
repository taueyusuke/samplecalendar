Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'conferencerooms#index'
  get '/events', to: 'events#index'
  
  get '/conferencerooms', to: 'conferencerooms#show'
  get '/users/:id', to: 'users#show', as: 'user'
  
  get '/conferencerooms/:id', to: 'conferencerooms#show', as: 'conferenceroom'
  resources :conferencerooms, only: %i(new create index edit update destroy) do
  resources :users, only: %i(new create)
    resources :events, only: %i(new create edit destroy update destroy index)
  end
end
