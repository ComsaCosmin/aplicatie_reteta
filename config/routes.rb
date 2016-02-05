Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "homes#index"


  get :admin, :to => 'admin/homes#index'

  devise_for :users, controllers: {registrations: 'registrations'}

  namespace :admin do
    resources :homes
    resources :recipes
    
  end

  resources :user_details
end
