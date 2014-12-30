Eventario::Application.routes.draw do

  

  resources :venues do
    collection do
      post :import
      get :autocomplete # <= add this line
    end
  end
  



  devise_for :users
  resources :eventos
  resources :users
  resources :venues
  get '/mapa'=> 'eventos#mapa', as: 'mapa'
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/hola'    => 'high_voltage/pages#show', id: 'hola'
  get '/aplicacion'    => 'high_voltage/pages#show', id: 'aplicacion'
  get '/eventos_new'    => 'high_voltage/eventos#show', id: 'new'
  get '/venues_new'    => 'high_voltage/venues#show', id: 'new'
  root :to => 'high_voltage/pages#show', id: 'home'

end
