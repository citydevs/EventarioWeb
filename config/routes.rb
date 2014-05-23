Eventario::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :eventos
  get '/mapa'=> 'eventos#mapa', id: 'mapa'
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/hola'    => 'high_voltage/pages#show', id: 'hola'
  get '/eventos_new'    => 'high_voltage/eventos#show', id: 'new'
  root :to => 'high_voltage/pages#show', id: 'home'

end
