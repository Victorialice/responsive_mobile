Rails.application.routes.draw do

  resources :news_categories, only: [:show]
  resources :categories, only: [:show]
  resources :news, only: [:show]



  get 'products' => 'products#index'
  get 'products/:id' => 'products#show'
  get 'recorder' => 'products#show'
  get 'news' => 'news#index'


  get '/' => 'home#index'
  get 'repair' => 'home#repair'

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    get 'sessions/new'
    root 'home#index'
    get    '/login',  to: "sessions#new"
    post   '/login',  to: "sessions#create"
    delete '/logout', to: "sessions#destroy"

    resources :industries
    resources :categories
    resources :products
    resources :options
    resources :product_attachments
    resources :pdf_categories
    resources :utilities
    resources :news_categories
    resources :news
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
