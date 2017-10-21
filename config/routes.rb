Rails.application.routes.draw do

  get 'ideas/index'

  get 'ideas/show'

  # User Routes
root 'users#new'

# New User
get   'register'      => 'users#new',         as: 'new_register'
get   'users/new'     => 'users#new'
# Create User
post  'register'      => 'users#create',      as: 'register'
post  'users'         => 'users#create'
# Show User
get   'users/:id'     => 'users#show',        as: 'user'
# New Login
get   'login'         => 'sessions#new',      as: 'new_login'
get   'sessions/new'  => 'sessions#new'
# Login
post  'login'         => 'sessions#create',   as: 'login'
post  'sessions'      => 'sessions#create'
# Logout
delete    'logout'    => 'sessions#destroy',  as: 'logout'
delete    'sessions'  => 'sessions#destroy'

resources :ideas
post   '/ideas/:id' => 'ideas#create'
get    '/ideas/:id' => 'ideas#show'

post '/ideas/:id/create' => 'likes#create'
delete '/ideas/:id/destroy' => 'likes#destroy'

end
