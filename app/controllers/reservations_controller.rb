class ReservationsController < ApplicationController


  layout :resolve_layout

  before_action :find_visitor

  before_action :find_party

  #before_action :find_title


  def index

      
    
    @reservations = @party.reservations


  end



def new

    @reservation = @visitor.build_reservation(:visitor_id => @visitor.id)
 
end


def create
   

   @reservation = @visitor.build_reservation(reservation_params)
      

    if @reservation.save!


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

    params.require(:reservation).permit(:name, :visitor_id, :party_id, :accept)

  end

  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  

  end


   def find_party

      if params[:party_id]

         @party = Party.find(params[:party_id])

      end
  

  end

end


