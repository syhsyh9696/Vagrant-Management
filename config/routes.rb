Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  mount Thredded::Engine => '/forum'

  resources :vagrantfiles
  resources :experiments, only: [:index, :show]

=begin
  resources :users, only: [:show] do
    get 'student', to: 'students#show'
    get 'student/new', to: 'students#new'

    post 'student', to: 'students#create'

    put 'student', to: 'students#update'
    patch 'student', to: 'student#update'
  end
=end

  resources :users, only: [:show] do
    resources :submissions
  end



end
