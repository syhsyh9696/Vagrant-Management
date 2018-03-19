Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  mount Thredded::Engine => '/forum'

  resources :vagrantfiles
  resources :experiments, only: [:index, :show]
end
