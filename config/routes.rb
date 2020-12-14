Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :games do
    collection do
      get :genres
      get :index_0
      get :index_1
      get :index_2
    end
    resources :gamecomments, only:[:new, :create, :destroy, :show, :edit, :update]
  end
  resources :users, only:[:show, :edit, :update]do
    collection do
      get :nohiristeeru
      patch :grant
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
