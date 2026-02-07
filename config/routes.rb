Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  post '/auth/register', to: 'authentication#register'
  
  get '/up', to: 'rails/health#show', as: :rails_health_check
end