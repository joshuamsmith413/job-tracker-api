Rails.application.routes.draw do
  resources :users
  resources :job_applications
  post '/job_applications/get_apps', to: 'job_applications#user_apps'
  post '/auth/login', to: 'auth#create'
end
