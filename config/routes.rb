Rails.application.routes.draw do
  resources :furimas, only: :index
end
