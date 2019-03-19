Rails.application.routes.draw do
	get 'categories/show'
	devise_for :users, controllers: {
		registrations: :registrations,
		confirmations: :confirmations
	}

	root controller: :articles, action: :index
	resources :articles, only: %i[index show]
	resources :employees, only: [:index]
	resources :categories, only: [:show]
end
