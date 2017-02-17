Rails.application.routes.draw do
  get "/search" => "search#index"
  post "/bills" => "search#bills"
  post "/legislators" => "search#legislators"

  get "/beta" => "campaigns#beta"

  resources :bills
  resources :legislators
  resources :campaigns

  namespace :api do
    namespace :v1 do
      resources :campaigns, only: [:show] do
        get '/bill' => 'campaigns#bill'
        get '/legislators' => 'campaigns#legislators'
      end

      resources :actions
    end
  end

end
