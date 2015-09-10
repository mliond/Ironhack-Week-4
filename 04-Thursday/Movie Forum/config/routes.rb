Rails.application.routes.draw do

  get '/movies/search' => 'movies#search'
  get '/movies/search_results' => 'movies#search_results'
  resources 'movies'
  
end
