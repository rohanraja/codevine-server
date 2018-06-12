require 'resque/server'

Rails.application.routes.draw do
  resources :value_holders
  resources :var_instances
  resources :clr_class_instances
  resources :source_file_infos
  get 'api/codefiles'

  get 'api/fileruns'

  get 'api/codestory'

  get 'api/framevars'

  get 'api/scopeVars'

  resources :line_runs
  resources :method_runs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Resque::Server.new, at: "/resque"

end
