Rails.application.routes.draw do
  # for simple resources:
  # resources 'projects' 
  
  resources 'entries', only: [:edit, :update, :destroy]

  # for nested resources: 
  resources 'projects'  do
    resources 'entries', only: [:new, :create]
  end

end
