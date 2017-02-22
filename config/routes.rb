Rails.application.routes.draw do
  get "/search" => "search#index"
  post "/bills" => "search#bills"
  post "/legislators" => "search#legislators"

  get "/beta" => "campaigns#beta"

  resources :bills
  resources :legislators
  resources :campaigns
end
