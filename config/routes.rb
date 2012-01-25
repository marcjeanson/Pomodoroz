Pomodoroz::Application.routes.draw do
  root to: 'activities#index'
  resource :charts, :only => :show
  resources :activities do
    resources :pomodoros do
      member do
        put 'complete'
        put 'reset'
      end
    end
  end
end
