Rails.application.routes.draw do
  root to: "home#index"
  get 'admin/index',as: 'admin'
  get 'admin/users',as: 'users_list'
  get 'home/another'
  get 'about/index', as: 'about_us'
  get 'contact/index', as: 'contact_us'
  get 'home/search'
  get '/users' => 'registrations#index'
  get 'house/:id/booking/booked' => 'houses#house_booking',as:'after_house_booking'
  get 'houses/:id/booked/:booked_status' => 'houses#booked',as: 'booked'
  post 'house/:id/booking/booked' => 'houses#house_booking',as: 'client_house_booking'
  
  delete 'delete/users/:id' => 'admin#destroy_user',as: 'delete_user'
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :houses do
    resources :house_pictures, shallow: true
      collection do
        post :confirm 
      end
    
      member do
        get 'booking'
      end
  end
  
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
