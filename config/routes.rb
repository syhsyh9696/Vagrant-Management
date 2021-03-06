Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  mount Thredded::Engine => '/forum'

  resources :vagrantfiles do 
    member do 
      get 'download'
    end
  end

  resources :experiments do 
    collection do
      get 'feed', format: 'rss'
    end

    member do 
      get 'followers'
      get 'content'
      get 'serverfile'
      get 'serverfile_content'
      get 'serverfile_download'
    end
  end

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

  resources :submissions

  post 'relationships/experiments', to: 'relationships#follow_experiment'
  delete 'relationships/experiments', to: 'relationships#unfollow_experiment'

  # Static controller
  get '/wiki', to: 'static#wiki'
  get '/rss', to: 'static#rss'
  get '/hof', to: 'static#hof'
  get '/feed', to: 'static#feed'

  mount Test::API => '/test' #url: localhost/test/api/v1/hello
  mount Upload::API => '/upload'
end
