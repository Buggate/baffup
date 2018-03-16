class CataloguesController < ApplicationController

   layout :resolve_layout

    # before_action :find_party


     before_action :find_title

  def index

    @party = Party.find_by_title(@title)

    @catalogues = Catalogue.where(:party_id => @party).paginate(page: params[:page], per_page: 6)

   

  end


def register

  @party = Party.find_by_title(@title)

  @visitor = Visitor.find(params[:visitor_id])

  
end

  def create

    @party = Party.find_by_title(@title)

    @catalogue = @party.catalogues.build({:party_id => @party.id, :title => @party.title, file_name: params[:file] })

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

    params.require(:catalogue).permit(:file_name, :party_id, :title)

  end


  

  def find_party

    id = params[:user_id]

    @user = User.find(id)

      if params[:party_id] 

         @party = Party.find_by_user_id(@user)

      end
  end



  def find_title

    @title = params[:title]

      
  end








    def initialize_party

      if @photo.party_id != nil
      
      @party = Party.find(@photo.party_id)
      
    end

  end





end