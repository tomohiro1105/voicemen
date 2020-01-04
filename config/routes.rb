Rails.application.routes.draw do
  root 'home#index'
  resources :home, onry: [:index, :new, :create] do
    collection do
      get :word_register
    end
  end 

end
