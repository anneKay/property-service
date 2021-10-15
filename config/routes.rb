Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get "/properties/near", to: "properties#get_near_by_properties"
  end
end
