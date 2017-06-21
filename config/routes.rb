Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'keeper#index'
  get 'keeper/index'
  get 'keeper/form'
  get 'keeper/rank'
  post 'keeper/rank'
  get 'keeper/contato'

end
