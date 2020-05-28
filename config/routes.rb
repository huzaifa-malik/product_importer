Rails.application.routes.draw do
  resources :products, except: [:new, :create, :edit, :update, :destroy] do
    collection do
      put :import_from_csv
    end
  end
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
