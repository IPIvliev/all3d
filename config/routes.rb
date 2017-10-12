Rails.application.routes.draw do


  # Администрирование
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'
  resources :articles

  resources :products

  # Проекты
  resources :projects
  get ":project/editgallery" => "projects#get_gallery", as: :get_project_gallery
  post ":project/editgallery" => "projects#edit_gallery", as: :edit_project_gallery
  delete ":project/delete/:image" => "projects#delete_projectimage", as: :delete_projectimage
  get ":user/projects" => "projects#user_projects", as: :user_projects


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
    resources :articles

    devise_for :users, controllers: { sessions: 'sessions' }
  end

  # Корневая страница
  root :to => "static_pages#index"
end
