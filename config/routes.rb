Rails.application.routes.draw do

  #管理者用
  devise_for :admins,skip: [:passwords,], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    # get '/nurses' => 'nurses#index', as: 'nurses'
    # patch '/nurses/edit' => 'nurses#update', as: 'nurses_edit'
    resources :patients, only: [:new, :create, :destroy]
    resources :nurses, only: [:index, :update]
    resources :admins, only: [:edit, :update]
  end


  #看護師用
  devise_for :nurses,skip: [:passwords,], controllers: {
    registrations: "nurse/registrations",
    sessions: "nurse/sessions"
  }

  scope module: :nurse do
    root 'homes#top', as: 'top'
    resources :nurses, only: [:update]
    get 'nurses/mypage' => 'nurses#show', as: 'mypage'
    resources :schedules, only: [:show, :index, :create, :destroy, :new] do
      resources :reviews, expect: [:show]
    end
    resources :task_lists, only: [:create, :destroy] do
      resources :tasks, expect: [:index, :show]
    end
  end

end
