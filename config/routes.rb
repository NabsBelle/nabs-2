Rails.application.routes.draw do

constraints ->(request) { request.format == :json } do
  resources :movies
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
