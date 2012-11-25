HundredHours::Application.routes.draw do
  resources :documents, :only => [:show]
  match "about" => "pages#about"
  root :to => "home#index"
  
end
