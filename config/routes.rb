Rails.application.routes.draw do
  get 'bookinglist/slots'
  resources :timeslots
  resources :facilities
  devise_for :users
  resources :bookings
  get 'home/about'
  #root 'home#index'
  root 'facilities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
