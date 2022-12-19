Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    put :hide, on: :member
  end
end
