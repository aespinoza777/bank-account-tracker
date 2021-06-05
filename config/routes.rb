Rails.application.routes.draw do
 resources :users
 resources :sessions
 resources  :banks do 
 resources :accounts, only: [:new, :index]
 end
resources :accounts, except: [:new]
end