Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
  	registrations: "users/registrations",
    sessions: 'users/sessions'
  }

	root 'homes#index'
end
