Rails.application.routes.draw do
  
  get '/books/ordered' => 'books#ordered'
  get '/books/searched' => 'books#searched'

  resources 'books' do 
    resources 'reviews' 
  end
end
