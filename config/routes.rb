Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  get '/my-journey', to: 'journey#show', as: 'journey'

  get '/step-3', to: 'pages#step3', as: 'step3'

  post "/webhooks/new-response", to: "webhooks#new_response", as: "webhooks_new_response"
  get  "/webhooks/redirect/:token", to: "webhooks#redirect"
end
