Rails.application.routes.draw do

  get '/contacts/favorites' => 'contacts#index_favorites'

  resources 'contacts'
  
end
