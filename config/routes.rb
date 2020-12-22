Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  resources :topics, only:[:index, :show, :create, :destroy] do
    resources :posts, only:[:create, :destroy]
  end

  resources :games do
    collection do
    end

    resources :likes, only:[:create, :destroy]

    resources :game_comments, shallow: true do
      resources :useful, only:[:create]
    end
    #resources :game_comments, only:[:new, :create, :show, :edit, :update, :destroy]
  end

  resources :users, only:[:show, :edit, :update]do
    collection do
      get :nohiristeeru
      patch :grant
    end

    resources :likes, only:[:index]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
