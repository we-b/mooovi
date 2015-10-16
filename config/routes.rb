TechReviewSite::Application.routes.draw do
  resources :products, only: :show do
    collection do
      get 'search'
    end
  end
  root 'products#index'

end
