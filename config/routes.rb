Rails.application.routes.draw do


  resources :friendships, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepage#index"
  get 'users', to: 'users#index'
  get 'users/show'

  resources :comments, only: [:create]
  
  devise_for :users, :controllers => { registrations: 'registrations' },  
                     :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
                     
  resources :posts do
    resources :likes, only: [:create, :destroy]

    member do
      get :delete
      delete :delete, action: :destroy

    end
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
      get '/users/sign_out' => 'devise/sessions#destroy' 
      get '/users/edit' => 'registrations#edit'
  end

end
