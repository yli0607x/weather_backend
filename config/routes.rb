Rails.application.routes.draw do

  namespace :api do
      resources :googlemap, only: [:create]
      resources :locations
  end

  get 'api/weather', to: 'api/weather#weathers'
  

end
