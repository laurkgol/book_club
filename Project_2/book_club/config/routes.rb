Rails.application.routes.draw do
root to: 'clubs#index'

resources :clubs do
  resources :meetings
  resources :books
  resources :members

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
