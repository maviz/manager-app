Rails.application.routes.draw do
  resources :payment_reqs, except: [:new] 
  root "payment_reqs#index"
end
