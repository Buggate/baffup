Rails.application.routes.draw do
 
  devise_for :users, class_name: 'FormUser', :controllers => { :registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :profiles
  resources :reservations
  resources :abouts, only: :show
  resources :how_it_works, only: :show
  resources :term_and_conditions, only: :show
  resources :privacies, only: :show
  resources :contacts, only: [:new, :create, :show]
 
  resources :parties do
    resources :invites
    resources :requests

  end

  resources :visitors do 

   
    resources :albums do
      member do
        put "like", to: "albums#upvote"
        put "dislike", to: "albums#downvote"
     end
   end
 
  resources :comments, except: [:index, :new, :show] do
      member do
      get :reply
     end
    end

    get 'catalogues/register'
    
  end

   get 'notice', to: 'notifications#index', as: 'notifications'
   get 'parties/:id/edit_venue' => 'parties#edit_venue', :as => :edit_venue_parties
   get 'parties/:id/edit_date' => 'parties#edit_date', :as => :edit_date_parties
   get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
   get 'profiles/:id/edit_picture' => 'profiles#edit_picture', :as => :edit_picture_profiles
   get 'contact-me', to: 'messages#new', as: 'new_message'
   post 'contact-me', to: 'messages#create', as: 'create_message'
   get 'photo-album', to: 'catalogues#index', as: 'catalogues'
   post 'photo-album', to: 'catalogues#create', as: 'create_catalogue'
   delete 'delete_catalogue', to: "catalogues#delete_catalogue"
   delete 'delete_all', to: 'catalogues#delete_all'
   root 'public#index'


end

