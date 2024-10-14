Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end

  devise_for :users, controllers: {
    passwords: 'users/passwords'     # personalizo el restablecimiento de contraseña
  }


  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


end
