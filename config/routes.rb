Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments, only: [ :new, :create, :destroy ]
  end

  devise_for :users, controllers: {
    passwords: "users/passwords"     # personalizo el restablecimiento de contraseña
  }

  # rutas para que el administrador gestione los roles de los usuarios
  resources :users, only: [ :index ] do
    member do
      get "edit_role"        # ruta para que el administrador pueda ver el formulario para editar el rol
      patch "update_role"     # ruta para que el administrador actualice el rol
    end
  end

  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
