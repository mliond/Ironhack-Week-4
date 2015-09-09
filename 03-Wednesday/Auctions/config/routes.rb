Rails.application.routes.draw do

  resources 'products', only: [:index, :show, :edit, :update]

  resources 'users' do
    resources 'products', only: [:new, :create]
  end

end
