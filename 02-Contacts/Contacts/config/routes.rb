Rails.application.routes.draw do

  get '/' => 'contacts#index'
  get '/:id' => 'contacts#show'

end
