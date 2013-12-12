TheIguanas::Application.routes.draw do
  root :to => "iguanas#index"

  resources :iguanas, :except => [:destroy]

  resources :iguana_house_cleaning_requests, :only => [:new, :create] do
    member do
      post :approve, :to => "iguana_house_cleaning_requests#approve"
      post :deny, :to => "iguana_house_cleaning_requests#deny"
    end
  end

end
