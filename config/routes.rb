Rails.application.routes.draw do
  get 'categories/show'
	devise_for :users

	root controller: :articles, action: :index
	resources :articles, only: [:index, :show]
	resources :employees, only: [:index]
	resources :categories, only: [:show]
end
