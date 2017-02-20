Rails.application.routes.draw do
	root 'homes#index'

	devise_for :admins
	devise_for :users, controllers: {registrations: "users/registrations",sessions: 'users/sessions'} do
		get '/users/sign_out' => "devise/sessions#destroy"
	end

	resources :cars, only:[:index, :show]

	namespace :admins do
		get '/', to: 'cars#dashboard', as: ''
		resources :cars
	end

end
