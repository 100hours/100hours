HundredHours::Application.routes.draw do
  resources :documents, :only => [:show]
  resource :feedback, :only => [:new, :create, :show]
  match "about" => "pages#about"
  root :to => "home#index"
  
end
