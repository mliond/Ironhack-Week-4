Rails.application.routes.draw do

  resources 'links'
  
  get '/lookup/:short_url' => 'links#forward'
end
