class AlbumsController < ApplicationController

  before_action :find_party

  before_action :find_visitor


  def index
    

          
  end


 def create

        @album = @visitor.albums.build(album_params)

        @album.save    

        redirect_to visitor_path(@visitor.id) 



  end

  #def destroy
    

   # @album = @profile.albums.find(params[:id])
  #  @album.destroy


   # redirect_to profile_path(@profile)

 # end


  def upvote

    current_user = @visitor.user

    @album = Album.find(params[:album_id])

    @album.upvote_by current_user

      redirect_back(fallback_location: visitor_path)

  end

  def downvote

    album = Album.find(params[:id])
    
    album.downvote_by @visitor

      redirect_back(fallback_location: visitor_path)
      
  end




  private

  def album_params

    params.require(:album).permit(:caption, :picture, :visitor_id, :party_id,)

  end

  def find_party

      if params[:party_id]

         @party = Party.find(params[:party_id])

      end
  end


  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  end

  
end
