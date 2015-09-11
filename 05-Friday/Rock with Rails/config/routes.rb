Rails.application.routes.draw do

  get '/concerts/today' => 'concerts#concerts_today'
  get '/concerts/month' => 'concerts#concerts_month'
  resources 'concerts'

end
