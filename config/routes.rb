Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepage#index"
  get 'users', to: 'users#index'
  get 'users/show'


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
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
