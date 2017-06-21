Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  # Статические страницы
  get "/index.html", :to => "static_pages#index"
  get "/contacts.html", :to => "static_pages#contacts"
  get "/users.html", :to => "users#index"
  get "/messages", :to => "users#messages", :as => "messages"

  # Контакты
  post "newcontact", :to => 'contacts#create'

  # Пользователи
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users

  # Личные сообщения
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # Динамические ресурсы
  resources :models
  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
      put "commentlike", to: "posts#comment_upvote"
      put "commentdislike", to: "posts#comment_downvote"
    end
  end

  resources :categories

  post "newcomment", :to => 'comments#new'
  resources :comments

  namespace :api do
    resources :categories
    resources :posts
    resources :comments
    resources :users
    resources :models

    devise_for :users, controllers: { sessions: 'sessions' }
  end

  # Корневая страница
  root :to => "static_pages#index"
end
