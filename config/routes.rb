Rails.application.routes.draw do
  # Ruta para la página de inicio
  get "home/index"
  root "home#index"

  # Configuración de Devise para usuarios
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update]
  end

  # Rutas para ofertas laborales y sus postulaciones
  resources :ofertas_laborales do
    resources :postulaciones, only: [:create] # Solo permite crear postulaciones
  end

  # Ruta para ver las postulaciones de un usuario específico
  resources :users, only: [:edit, :update] do
    get 'postulaciones', to: 'postulaciones#index', as: 'postulaciones' # Define la ruta para las postulaciones del usuario
    resources :postulaciones, only: [:index, :create]
  end

  # Health check para verificar el estado de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para PWA (Progressive Web App)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end