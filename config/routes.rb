Rails.application.routes.draw do
  



  
 
  devise_for :users, class_name: 'FormUser', :controllers => { :registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :notifications, only: :index

   get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

  resources :parties do

    resources :comments

    resources :invites

    resources :requests

  end

   get 'parties/:id/edit_venue' => 'parties#edit_venue', :as => :edit_venue_parties
    # you can change put to post as you see fit
    #put 'parties/:id' => 'parties#update'

     get 'parties/:id/edit_date' => 'parties#edit_date', :as => :edit_date_parties
    # you can change put to post as you see fit
   # put 'parties/:id' => 'parties#update'

  resources :profiles 

  resources :visitors do 

    get 'catalogues/register'

    resources :comments, except: [:index, :new, :show] do

      member do

        get :reply
        
      end
      
    end

    resources :reservations

     resources :albums 
 
  end

  resources :photos

  resources :visitors do

   resources :albums do

      member do

        put "like", to: "albums#upvote"
        put "dislike", to: "albums#downvote"


  end

end

end

   resources :reservations

   resources :catalogues, only: [:create, :index]
  
    delete 'delete_catalogue', to: "catalogues#delete_catalogue"

    delete 'delete_all', to: 'catalogues#delete_all'

  root 'public#index'

  resources :abouts, only: :show

  resources :how_it_works, only: :show

  resources :term_and_conditions, only: :show

  resources :privacies, only: :show

  resources :contacts, only: [:new, :create, :show]


end
