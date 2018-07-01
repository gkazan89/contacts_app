Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contact_url" => "contacts#contact_method" 
  get "/all_contacts_url" => "contacts#all_contacts_method"
  get "/contacts" => "contacts#index"
  get "/contacts/:id" => "contacts#show"
end
