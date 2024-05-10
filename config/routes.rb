Rails.application.routes.draw do
  root 'plans#index'
  
  resources :plans do 
    collection do
      get 'important'
    end
  end
  get 'report', to: 'plans#index'
end
