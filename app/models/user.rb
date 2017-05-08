class User < ApplicationRecord

  after_create :create_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2, :yahoo_oauth2]


         has_one :profile
         has_many :parties

         has_many :invitations, :class_name => "Invite", :foreign_key => 'guest_id'
         has_many :sent_invites, :class_name => "Invite", :foreign_key => 'host_id'

         has_many :friends


         has_many :occassion_buddies, :class_name => "Friend", :foreign_key => 'user_id'

         has_many :visitors
 
         has_many :notifications

   private

         def create_profile


         	Profile.create(user_id: self.id,

         		            name: self.name,
                        email: self.email)


         end


         def self.from_omniauth(auth)

             where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

              user.provider = auth.provider
              user.uid = auth.uid
              
              user.name = auth['info']['name'] || ""
              user.email = auth.info.email
              user.oauth_token = auth.credentials.token
              user.access_token = auth.credentials.token

           
            end

         end

     def contacts_callback


            @contacts = request.env['omnicontacts.contacts']

           @user = request.env['omnicontacts.user']

           puts "List of contacts of #{@user[:name]} obtained from #{params[:importer]}:"

            @contacts.each do |contact|
              
             puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
          end


     end





         def google_oauth2_client
              
              if !@google_oauth2_client

                  @google_oauth2_client = Google::APIClient.new(:application_name => 'Baffup', :application_version => "1.0.0" )

                  @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})

              end

                @google_oauth2_client

          end


          def yahoo_oauth_client

               oauth_client = OAuth2::Client.new(YAHOO_CLIENT_ID, YAHOO_SECRET, {
                    site: 'https://api.login.yahoo.com',
                    authorize_url: '/oauth2/request_auth',
                    token_url: '/oauth2/get_token',
                  })

             end

             def new_token

                auth = "Basic #{Base64.strict_encode64("#{YAHOO_CLIENT_ID}:#{YAHOO_SECRET}")}"

                  new_token = oauth_client.get_token({
                    redirect_uri: YOUR_CALLBACK_URL,
                    refresh_token: YOUR_REFRESH_TOKEN,
                    grant_type: 'refresh_token',
                    headers: { 'Authorization' => auth } })

                end



         def password_required?

            super && provider.blank?

        end


        def update_with_password(params, *options)

            if encrypted_password.blank?
              update_attributes(params, *options)
            else
              super
            end

        end


        def facebook

         @facebook ||= Koala::Facebook::API.new(email)


        end

        







end


