Rails.application.routes.draw do
  resources :users
  resources :job_applications
  post '/job_applications/get_apps', to: 'job_applications#user_apps'
  post '/auth/login', to: 'auth#create'
  post 'job_applications/update_interview', to: 'job_applications#update_interview'
  post 'job_applications/update_weekCheckup', to: 'job_applications#update_weekCheckup'
  post 'job_applications/archive_app', to: 'job_applications#archive_app'
  post 'job_applications/update_response', to: 'job_applications#update_response'
  get '/set_user', to: 'users#set_user'
end
