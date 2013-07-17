WhineOneOne::Application.routes.draw do
  root to: 'whine#index'

  get '/whine/new', to: 'whine#new'
  get '/:tag/pick_whine', to: 'whine#pick_whine'
  get '/:tag/trending', to: 'whine#trending_whines'
  get ':tag', to: 'tag#show'
  post 'submit', to: 'whine#create'
end
