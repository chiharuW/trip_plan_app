Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  get 'users/:user_id/plans' => 'users#index', as: 'user_plans'
  resources :users, only: [:index, :show, :edit, :update]
 end

# 顧客用
# URL /users/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

 scope module: :user do
   root 'homes#top'
   get 'users/about' => 'homes#about', as: 'about'
   get 'users/mypage' => 'users#show', as: 'mypage'
   get 'users/information/edit' => 'users#edit', as: 'edit_information'
   patch 'users/information' => 'users#update', as: 'update_information'
   put 'users/information' => 'users#update'
 end

end
