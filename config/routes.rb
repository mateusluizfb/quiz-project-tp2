Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/dashboard' => 'static_pages#dashboard'

  get 'disciplines/export_all' => 'disciplines#export_all'

  resources :disciplines do
    patch 'associate'
    patch 'disassociate'
    get 'export'
    
    resources :topics
  end

  resources :topics
  resources :users
  resources :quizzes
end
