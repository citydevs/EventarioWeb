Bootstrap::Application.routes.draw do

  get "formularios/por_post"
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/hola'    => 'high_voltage/pages#show', id: 'hola'
  get '/home', to: redirect('/')
  post "formularios/por_post"
  root :to => 'high_voltage/pages#show', id: 'home'

end