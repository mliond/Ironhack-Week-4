Rails.application.routes.draw do

  get '/contact' => 'contacts#index'
  get '/contact/:id' => 'contacts#show'
  get '/add_contact' => 'contacts#add_contact'
  post '/add_contact' => 'contacts#create'

end
