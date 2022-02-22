Rails.application.routes.draw do

  get '/studios', to: 'studios#index'

  get 'movies/:id', to: 'movies#show'
  post 'movies/:id', to: 'movies#create'

  get '/actors/:id', to: 'actors#show'

end
