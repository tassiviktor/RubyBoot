# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :apiv2 do
    resources :users
  end
  namespace :apiv2 do
    resources :realms
  end
  namespace :api do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
