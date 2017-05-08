class VisitorsController < ApplicationController

	layout 'visit'


	 before_action :authenticate_user!, except: [:index, :show]

		    def index


               @albums = @visitor.party.albums.page(params[:page], per_page: 6)
		    

		    end


			def show


				@visitor = Visitor.find(params[:id])

				@party = @visitor.party

				@albums = @visitor.party.albums

				redirect_to_good_slug(@visitor) and return if bad_slug?(@visitor)

			end


end
