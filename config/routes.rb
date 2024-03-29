Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users do
        resources :orders, only: [:index, :show, :create, :update, :destroy] do
          resources :payments, only: [:index, :create, :destroy]
          # resources :order_items, only: [:index, :create, :update, :destroy]
        end
        resources :carts, only: [:index, :create] do
          resources :cart_items, only: [:index, :create, :update,:destroy]
        end
        resources :categories, only: [:index, :show, :create, :update, :destroy] do
          resources :sub_categories, only: [:index, :show, :create, :update, :destroy] do 
            resources :products, only: [:index, :show, :create, :update, :destroy]
          end
        end
      # end
    end
  end
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, 
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :users do
    post 'passwords/forgot', to: 'passwords#forgot'
    post 'passwords/reset', to: 'passwords#reset'
  end
  # get "up" => "rails/health#show", as: :rails_health_check
end
