WhineOneOne::Application.routes.draw do
  root to: 'whine#index'

  get 'whine', to: 'whine#new'
  get 'pick_whine', to: 'whine#pick_whine'
  post 'submit', to: 'whine#create'
end
