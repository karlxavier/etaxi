Rails.application.routes.draw do
	root to: 'homes#index'

	devise_for :admins
	devise_for :users, controllers: {registrations: "users/registrations",
																		sessions: 'users/sessions',
																		omniauth_callbacks: 'users/omniauth_callbacks'} do
		get '/users/sign_out' => "devise/sessions#destroy"
	end

	resources :cars, only:[:index, :show]

	namespace :admins do
		get '/', to: 'cars#dashboard', as: ''
		resources :cars
	end

end
