Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Auth
      post 'register', to: 'auth#register'
      post 'login',    to: 'auth#login'

      # Organizations
      resources :organizations do
        resources :members, controller: 'organization_members', only: [:create]
        resources :boards, only: [:index, :create] do
          resources :lists, only: [:create] do
            resources :cards, only: [:create]
          end
        end
      end
    end
  end
end
