Rails.application.routes.draw do
  root :to => "parking_slots#index"
  resources :parked_vehicals do
    get :release
  end
  resources :parking_slots
  get 'allotParking', to: 'parking_slots#allot_parking', as: :allot_parking
  get 'releaseParking/:id', to: 'parked_vehicals#release', as: :release_parking
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
