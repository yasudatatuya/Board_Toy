Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :games do
    collection do
      get :genres
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
