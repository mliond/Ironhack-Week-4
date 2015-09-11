Rails.application.routes.draw do

  get '/concerts/today' => 'concerts#concerts_today'
  get '/concerts/month' => 'concerts#concerts_month'
  get '/concerts/budget' => 'concerts#concerts_budget'
  resources 'concerts'

end
