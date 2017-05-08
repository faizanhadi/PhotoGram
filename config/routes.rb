Rails.application.routes.draw do
 
 root 'pages#home' 
 
 get '/home', to: 'pages#home'
 
 #get '/photos', to: 'photos#index'
 #get '/photos/new', to: 'photos#new', as: 'new_photo'
 #post '/photos', to: 'photos#create'
 #get '/photos/:id/edit', to: 'photos#edit', as: 'edit_recipe'
 #patch 'photos/:id', to: 'photos#update'
 #get 'photos/:id',  to: 'photos#show', as: 'photos'
 #delete 'photos.:id', to: 'photos#destroy'
 
 resources :photos
end
