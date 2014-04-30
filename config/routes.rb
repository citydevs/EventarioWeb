Bootstrap::Application.routes.draw do

  resources :eventos
  get '/mapa'=> 'eventos#mapa', id: 'mapa'
  get "formularios/por_post"
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/hola'    => 'high_voltage/pages#show', id: 'hola'
  get '/eventos_new'    => 'high_voltage/eventos#show', id: 'new'
  get '/home', to: redirect('/')
  post "formularios/por_post"
  root :to => 'high_voltage/pages#show', id: 'home'

end