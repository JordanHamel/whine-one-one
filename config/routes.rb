WhineOneOne::Application.routes.draw do
  root to: 'whine#index'

  get 'whine', to: 'whine#new'
  get '/:tag/pick_whine', to: 'whine#pick_whine'
  get ':tag', to: 'tag#show'
  post 'submit', to: 'whine#create'
end
