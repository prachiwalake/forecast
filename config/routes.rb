Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'forecast/check_weather', to: 'forecast#check_weather', as: 'check_weather'
end
