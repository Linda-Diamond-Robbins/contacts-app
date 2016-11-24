Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get '/one_contact_url' => 'contacts#one_contact_method'
  # get '/all_contacts_url' => 'contacts#all_contacts_method'

  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  post "/contacts" => "contacts#create"
  get "/contacts/:id" =>"contacts#show"
  get "/contacts/:id/edit" =>"contacts#edit"
  patch "/contacts/:id" =>"contacts#update"
  delete "/contacts/:id" =>"contacts#destroy"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
