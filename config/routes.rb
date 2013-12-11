TheIguanas::Application.routes.draw do
  root :to => "Iguanas#index"

  resources :iguanas, :only => [:index, :show]
end
