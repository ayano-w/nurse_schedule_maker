Rails.application.routes.draw do

  namespace :admin do
    get 'nurses/index'
  end
  namespace :admin do
    get 'patients/new'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :nurse do
    get 'reviews/index'
    get 'reviews/edit'
  end
  namespace :nurse do
    get 'tasks/new'
    get 'tasks/edit'
  end
  namespace :nurse do
    get 'schedules/show'
    get 'schedules/index'
    get 'schedules/create'
    get 'schedules/destroy'
  end
  namespace :nurse do
    get 'nurses/show'
  end
  namespace :nurse do
    get 'homes/top'
  end
  #管理者用
  devise_for :admins,skip: [:passwords,], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  #看護師用
  devise_for :nurses,skip: [:passwords,], controllers: {
    registrations: "nurse/registrations",
    sessions: "nurse/sessions"
  }

end
