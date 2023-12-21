Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    namespace :v1 do
        resources :users do
          resource :follow, only: [:create, :destroy], controller: 'follows'
        end
    end
  end

end
