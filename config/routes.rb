Huestreet::Application.routes.draw do
  resources :asset
  match "/map" => "asset#index"
  match "/colors/:color" => "welcome#colors"
  match "/login" => "auth#index"
  match "/uploads" => "welcome#user_uploads"

  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  root :to                       => "welcome#home"
end
