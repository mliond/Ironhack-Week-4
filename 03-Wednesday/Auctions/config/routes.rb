Rails.application.routes.draw do

  get '/' => 'sessions#new'
  resources 'sessions', only: [:create]
  
  resources 'products', only: [:index, :destroy, :show] do
    resources 'bids', only: [:new, :create]
  end

  resources 'users', only: [:index, :show, :new, :create, :destroy] do  
    resources 'products', only: [:new, :create] 
  end
end
