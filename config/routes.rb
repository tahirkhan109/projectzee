Rails.application.routes.draw do
  get "programmer/index"

  get "admin/index"
  get "super_admin/index"
  resources :conferences do
    resources :attendee_details do
      collection do
        #get "add_popup_flight"
      end

    #resources :flight_detail
    #resources :ground_detail
    #resources :agenda_detail
    end
  end

  resources :welcome do
    collection do
      get "add_popup_flight"
      get "add_popup_ground"
      get "add_popup_agenda"
      post "create_flight_detail"
      get "add_flight_detail"
      get "add_ground_detail"
      post "add_agenda_detail"
    end
  end

  resources :admin do
  end
  #resources :attendee_details do
  #  get "display_attendee_details"
  #  post "display_attendee_details"
  #end

  resources :super_admin do
    get "display_conferences"
  end

  devise_for :users
  #get "welcome/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"

   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
