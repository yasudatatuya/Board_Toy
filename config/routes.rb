Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  resources :topics, only:[:index, :show, :create, :destroy] do
    resources :posts, only:[:create, :destroy]
  end
  resources :games do
    collection do
      get :genres
      get :index_0
      get :index_1
      get :index_2
    end
    resources :game_comments, only:[:new, :create, :show, :edit, :update, :destroy]
  end
  resources :users, only:[:show, :edit, :update]do
    collection do
      get :nohiristeeru
      patch :grant
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
