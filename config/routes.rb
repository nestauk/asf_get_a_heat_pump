Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  get '/step-1', to: 'pages#step_1', as: 'step_1'

  post "/webhooks/new-response", to: "webhooks#new_response", as: "webhooks_new_response"
  get  "/webhooks/redirect/:token", to: "webhooks#redirect"
end
