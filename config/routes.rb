Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :users
      get '/sign_up' => 'sessions#sign_up'
    end
  end
end
