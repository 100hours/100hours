HundredHours::Application.routes.draw do
  match "about" => "pages#about"
  root :to => "home#index"
end
