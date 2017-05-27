class CataloguesController < ApplicationController

	 layout :resolve_layout

     before_action :find_party


  def index
 
    @catalogues = @party.catalogues

   

  end


def register

  @visitor = Visitor.find(params[:visitor_id])

  
end

  def create

    @catalogue = @party.catalogues.build({:party_id => @party.id, file_name: params[:file] })

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

    params.require(:catalogue).permit(:file_name, :party_id,)

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
