Rails.application.routes.draw do

  devise_for :clients, controllers: {
    sessions: "clients/sessions",
    registrations: "clients/registrations"
  }
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  root to: 'static_pages#index'

end
