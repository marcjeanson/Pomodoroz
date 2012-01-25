Pomodoroz::Application.routes.draw do
  root to: 'activities#index'
  resources :activities do
    resources :pomodoros
  end
end
