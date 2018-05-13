Rails.application.routes.draw do
  get 'houses/index'
  get 'home/another'
  get 'house/:id/booking' => 'houses#booking',as: 'house_booking'
  get 'house/:id/booking/booked' => 'houses#house_booking',as:'after_house_booking'
  post 'house/:id/booking/booked' => 'houses#house_booking',as: 'client_house_booking'
  # post 'houses/house_booking'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "home#index"
  resources :houses do
      resources :house_pictures, shallow: true
      collection do
        post :confirm 
     end
  end
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
