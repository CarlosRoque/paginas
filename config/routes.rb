Paginas::Engine.routes.draw do
  resources :pages
  get 'featured', to: 'pages#index', featured: true
  get 'display/:id', to: 'pages#show', display_only: true
  root "pages#index"
end
