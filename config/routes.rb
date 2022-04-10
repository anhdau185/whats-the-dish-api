Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :dishes do
        member do
          put :like
          put :unlike
        end
      end
    end
  end

  resources :categories
  resources :dishes
end
