Rails.application.routes.draw do
  resources :posts do
    resources :thumbs
    resources :addendums
  end
  resources :users

  get '/login' => 'authentication#new'
  post '/login' => 'authentication#create'
  delete '/logout' => 'authentication#destroy'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
