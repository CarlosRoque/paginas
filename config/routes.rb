Paginas::Engine.routes.draw do
  resources :pages
  get 'featured', to: 'pages#featured'
  get 'display/:id', to: 'pages#display', as: "display"
  root "pages#index"
end
