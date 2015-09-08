Rails.application.routes.draw do

  # get '/contact' => 'contacts#index'
  # get '/contact/new' => 'contacts#add_contact'
  # post '/contact/new' => 'contacts#create'
  # get '/contact/:id' => 'contacts#show'

  resources 'contacts'
end
