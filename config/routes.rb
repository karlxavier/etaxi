Rails.application.routes.draw do
	root to: 'homes#index'

	devise_for :admins, controllers: {registrations: "admins/registrations",
									sessions: 'admins/sessions'
									}
	devise_for :users, controllers: {registrations: "users/registrations",
									sessions: 'users/sessions',
									omniauth_callbacks: 'users/omniauth_callbacks'
									} do
		get '/users/sign_out' => "devise/sessions#destroy"
	end

	resources :cars, only:[:index, :show]

	namespace :admins do
		get '/', to: 'cars#dashboard', as: ''
		resources :cars
		resources :car_images, only: [:create, :destroy]
	end

end
