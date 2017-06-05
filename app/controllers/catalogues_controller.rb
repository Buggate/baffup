class CataloguesController < ApplicationController

	 layout :resolve_layout

     before_action :find_party

    # before_action :find_user

        before_action :authenticate_user! 


  def index
    

    @user = User.find(params[:user_id])
    
    @catalogues = Catalogue.all.where({:party_id => @party.id, :user_id => @party.user.id}) 

  end


def register

  @visitor = Visitor.find(params[:visitor_id])

  @user = @visitor.user
  
  @catalogues = Catalogue.all.where({:party_id => @party.id, :user_id => @visitor.id})

  
end

  def create

    @catalogue = @party.catalogues.build({:party_id => @party.id, :user_id => @party.user.id, file_name: params[:file] })

    if @catalogue.save!

      render json: @catalogue

      flash[:notice] = "Catalogue Saved." 

    else

      puts 'Hello'

      render json: { error: 'Failed to process' }, status: 422

    end

  end

def delete_catalogue

  Catalogue.where(id: params[:catalogues]).destroy_all
  redirect_to root_url

end

def delete_all
  Catalogue.delete_all
  redirect_to root_url
end

  private


  def resolve_layout

    case action_name

    when "index", "create", "delete_catalogue", "delete_all"

      "catalogue"

    when "register"

      "list"

    else

      "application"

    end

 end


  def catalogue_params

    params.require(:catalogue).permit(:file_name, :party_id, :user_id)

  end


  

  def find_party

      if params[:party_id]

         @party = Party.find(params[:party_id])

      end

  end

   def find_user

      if params[:user_id]

         @user = User.find(params[:user_id])

      end

  end



    def initialize_party

      if @photo.party_id != nil
      
      @party = Party.find(@photo.party_id)
      
    end

  end





end
