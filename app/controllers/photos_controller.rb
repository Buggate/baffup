class PhotosController < ApplicationController

 

  layout 'photo'

   before_action :find_party



def index


 
     @photos = @party.photos

  end



  def new

    @photo = @party.photos.build({:party_id => @party.id, :visitor_id => @party.visitors.first.id})
 
  end





  def create

   
     
    	@photo = Photo.new(photo_params)
     
    	  if @photo.save

        flash[:notice] = "Photo created successfully."
        redirect_to photos_path(:party_id => @photo.party.id) 


    	  else

    	  	render 'new'

    	  end
     
    end
 
   def edit   

      @photo = Photo.find(params[:id])
           
            
    end
          


   def update

     @photo = Photo.find(params[:id])

       if @photo.update_attributes(photo_params)
              flash[:notice] = "Photo updated successfully."
              redirect_to visitor_photo_path
                    
         else

        render('edit')

            end

          end


  #def destroy
    

   # @photo = @profile.photos.find(params[:id])
  #  @photo.destroy


   # redirect_to profile_path(@profile)

 # end



  private

  def photo_params

    params.require(:photo).permit(:image, :visitor_id, :party_id,)

  end


  

  def find_party

      if params[:party_id]

         @party = Party.find(params[:party_id])

      end
  end


    def initialize_party

      if @photo.party_id != nil
      
      @party = Party.find(@photo.party_id)
      
    end

  end

  
end
