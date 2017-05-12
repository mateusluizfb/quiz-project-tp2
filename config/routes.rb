Rails.application.routes.draw do
  devise_for :users

  resources :disciplines
  resources :topics
  resources :quizzes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
