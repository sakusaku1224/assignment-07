Rails.application.routes.draw do
  # deviseが自動でログイン・登録ルート生成
  devise_for :users

  # トップページ
  root "rooms#index"

  # 登録済み施設一覧
  resources :rooms, only: [ :index, :new, :create, :show, :edit, :update, :destroy ] do
    collection do
      get :own
    end
  end

  # 予約確認ページ
  resources :reservations, only: [ :new, :create, :index, :edit, :update, :destroy ] do
    collection do
      get :confirm
      post :confirm
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
