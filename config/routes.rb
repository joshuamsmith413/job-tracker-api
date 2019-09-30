Rails.application.routes.draw do
  resources :users
  resources :job_applications
  post '/auth/login', to: 'auth#create'
end
