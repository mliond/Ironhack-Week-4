Rails.application.routes.draw do

  get '/links/:short_url' => 'links#forward'
  resources 'links'
end
