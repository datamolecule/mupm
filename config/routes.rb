DoorMat::Engine.routes.draw do
  get '/sign_up' => 'sign_up#new', as: 'sign_up'
  post '/sign_up' => 'sign_up#create'

  get '/sign_in' => 'sign_in#new', as: 'sign_in'
  post '/sign_in' => 'sign_in#create'
  get '/sign_out' => 'sign_in#destroy', as: 'sign_out'

  post '/terminate_session/:guid' => 'sessions#terminate', as: 'terminate_session'
  get '/reconfirm_password' => 'reconfirm_password#new', as: 'reconfirm_password'
  post '/reconfirm_password' => 'reconfirm_password#create'

  get '/add_email' => 'manage_email#new', as: 'add_email'
  post '/add_email' => 'manage_email#create'
  post '/delete_email' => 'manage_email#destroy'
  post '/set_primary_email' => 'manage_email#set_primary_email'

  get '/email_confirmation_required' => 'static#email_confirmation_required', as: 'email_confirmation_required'
  get '/confirm_email/:token/:email' => 'activities#confirm_email', as: 'confirm_email'
  post '/resend_email_confirmation' => 'activities#resend_email_confirmation', as: 'resend_email_confirmation'
  post '/download_recovery_key' => 'activities#download_recovery_key', as: 'download_recovery_key'

  get '/change_password' => 'change_password#new', as: 'change_password'
  post '/change_password' => 'change_password#create'

  get '/forgot_password_verification_mail_sent' => 'static#forgot_password_verification_mail_sent'

  get '/forgot_password' => 'forgot_passwords#new'
  post '/forgot_password' => 'forgot_passwords#create'
  get '/choose_new_password/:token/:email' => 'forgot_passwords#choose_new_password', as: 'choose_new_password'
  post '/reset_password' => 'forgot_passwords#reset_password', as: 'reset_password'
end

Rails.application.routes.draw do

  root 'static#home'
  get '/about' => 'static#about'

  get '/passwords' => 'passwords#index', as: 'passwords'
  post '/passwords' => 'passwords#create'
  get '/passwords/new' => 'passwords#new', as: 'new_password'
  get '/passwords/:id' => 'passwords#show', as: 'password'
  delete '/passwords/:id' => 'passwords#destroy'

  mount DoorMat::Engine => "/", as: "door_mat"

  match '*path', via: :all, to: 'static#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
