HundredHours::Application.routes.draw do
  resources :documents, :only => [:index, :show]
  resource :feedback, :only => [:new, :create, :show]
  match "about" => "pages#about"
  match "style" => "pages#style"
  match "howl/:id" => "howlers#howl"
  root :to => "home#index"
end
