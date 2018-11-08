Rails.application.routes.draw do
  root 'movies#search'
  post '/search', to: 'movies#index'
  get '/search', to: 'movies#search'
  get '/about', to: 'movies#about'
  get '/contact', to: 'movies#contact'
end
