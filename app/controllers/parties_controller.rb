class PartiesController < ApplicationController

  respond_to :html, :json

  layout :resolve_layout


   before_action :authenticate_user!

  	 def index

          @parties = Party.all.where(:user_id => current_user.id)
  
     end


    def show

       @party  = Party.find(params[:id])
       redirect_to_good_slug(@party) and return if bad_slug?(@party)

    end

    
    def new

       @wizard = ModelWizard.new(Party, session, params).start

       @party = @wizard.object
      
  
    end

    
    def create


       @wizard = ModelWizard.new(Party, session, params, party_params).continue

        @party = @wizard.object

        if @wizard.save


          create_visitor @party, @user

         
          flash[:notice] = "Party created successfully."


          redirect_to @party

        else

          render :new

        end
      
     
    end


    def edit

            @party ||= Party.find(params[:id])
            redirect_to_good_slug(@party) and return if bad_slug?(@party)
  
     end

     def edit_venue

            @party ||= Party.find(params[:id])
            redirect_to_good_slug(@party) and return if bad_slug?(@party)
  
     end

     def edit_date

            @party ||= Party.find(params[:id])
            redirect_to_good_slug(@party) and return if bad_slug?(@party)
  
     end
          


    def update

        @party = Party.find(params[:id])

            if @party.update_attributes(party_params)

               flash[:notice] = "Party updated successfully." 
              
              redirect_to @party
                   
          else

    

        end

  end


    
  
    def destroy

     
      @party = Party.find(params[:id])
      @party.destroy

       redirect_to profiles_path

     
    end



   private

   def resolve_layout

    case action_name

    when "show", "edit", "edit_date", "edit_venue" 

      "general"

     when "index"
     
      "mile" 

    else

      "party_form"

    end

 end



    def party_params

      return params unless params[:party]

      params.require(:party).permit(:current_step,
                                     :title,
                                    :venue,
                                    :date, 
                                    :user_id, 
                                    :picture,
                                    :category,
                                    :message,
                                    :rsvp_by
                                    )

    end

    def resolve_flash

        case action_name

          when "edit"

          flash[:notice] = "Picture updated successfully."

          when "edit_date"

          flash[:notice] = "Date updated successfully."
                 
          when "edit_venue"

          flash[:notice] = "Venue updated successfully."

          else

            flash[:notice] = "Party updated successfully."      

        end

    end



    def create_visitor(user, party)  
    
             @visitor = @party.visitors.build(party_id: @party.id, user_id: current_user.id)

              @visitor.save

    end  




         def create_catalogue(party, user) 


          Catalogue.create(party_id: @party.id,

                        :user_id => current_user.id)


         end




end
