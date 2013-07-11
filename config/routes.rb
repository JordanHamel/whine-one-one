WhineOneOne::Application.routes.draw do
  root to: 'whine#index'

  get 'whine', to: 'whine#new'
  post 'submit', to: 'whine#create'
end
