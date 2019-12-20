Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/bio'
  get 'welcome/contact'

  get 'articles/partenaires'
  get 'articles/applications'
  get 'articles/actualites'
  get 'articles/ateliers'
  get 'articles/formations'
  get 'articles/livres'
  get 'articles/musiques'

  # resources :articles, only: :show
  resources "contacts", only: [:new, :create]
  # namespace :admin do
  resources :articles
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
