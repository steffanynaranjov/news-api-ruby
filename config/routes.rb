Rails.application.routes.draw do
  get '/news', to: 'news#index'
  get '/news/search', to: 'news#search'
  get '/news/show', to: 'news#show'
end
