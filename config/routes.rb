Pomodoroz::Application.routes.draw do
  root to: 'activities#index'
  resources :activities
end
