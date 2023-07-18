Rails.application.routes.draw do
  resources :meshiterro
  root to: "homes#top"
end
