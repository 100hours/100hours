HundredHours::Application.routes.draw do
  resources :documents, :only => [:show]
  resource :feedback, :only => [:new, :create, :show]
  match "about" => "pages#about"
  match "style" => "pages#style"
  root :to => "home#index"

  mount HundredHours::API => "/"
end
