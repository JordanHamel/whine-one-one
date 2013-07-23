WhineOneOne::Application.routes.draw do
  root to: 'whine#index'

  get '/whine/new', to: 'whine#new'
  get '/whine/all', to: 'whine#all_whines'
  get '/:whine/get_tags', to: 'whine#get_tags'
  get '/:tag/trending', to: 'whine#trending_whines'
  get ':tag', to: 'tag#show'
  post 'submit', to: 'whine#create'
end
