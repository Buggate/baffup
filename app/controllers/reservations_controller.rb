class ReservationsController < ApplicationController


  layout :resolve_layout

	before_action :find_visitor

  #before_action :find_party

  before_action :find_title


  def index

    @party = Party.find_by_title(@title)
    
    @reservations = @party.reservations


  end



   def new 

    @party = Party.find_by_title(@title)
     
      @reservation = Reservation.new(:visitor_id => @visitor.id, :party_id => @visitor.party.id) 

   end


    def create

      
      @reservation = Reservation.new(reservation_params)   


     if @reservation.save


      flash[:notice] = "Reservations Saved." 

        
  
  	  redirect_to visitor_path(@visitor)

    else

    end

  end

  def destroy

    @party = Party.find_by_title(@title)
    

    @reservation = @vistor.reservations.find(params[:id])
    @reservation.destroy


    redirect_to group_url(@visitor.party.id)

  end


  private

  def resolve_layout

    case action_name

    when "index" 

      "general"

    else

      "reservation"

    end

 end

  def reservation_params

    params.require(:reservation).permit(:name, :visitor_id, :party_id, :accept, :title)

  end

  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  

  end


  def find_title

     @title = params[:title]

  end

end
