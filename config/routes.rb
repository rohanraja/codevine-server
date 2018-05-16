require 'resque/server'

Rails.application.routes.draw do
  resources :line_runs
  resources :method_runs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Resque::Server.new, at: "/resque"

end
