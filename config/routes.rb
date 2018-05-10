Rails.application.routes.draw do
  get 'houses/index'
  get 'home/another'
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
