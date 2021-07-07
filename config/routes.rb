# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: %i[index show] do
    resources :questions, only: [:show], shallow: true do
      resources :answers, only: [:show], shallow: true
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: [:create]
    get :result, on: :member
  end

  namespace :admin do
    resources :gists, only: %i[index show]
    resources :tests do
      resources :questions, except: [:index], shallow: true do
        resources :answers, except: [:index], shallow: true
      end
    end
  end
end
