class LaunchesController < ApplicationController

	before_action :find_operator

  attr_accessor :placeholder, :password, :password_confirmation


def create


  emails = params[:launch][:email].split(',')


   emails.each do |email|

    @launch  = @operator.launches.build(:operator_id => @operator.id, :email => email )

     @placeholder = "placeholder text"


   
   if  @launch.save

            
     LaunchMailer.baffsup_ready(@launch, @operator, new_user_registration_url(:email => @launch.email, :password => @placeholder, :password_confirmation => @placeholder )).deliver_now     
         
   end
  
  end 
   
    redirect_to staff_path
end 



 private




  def launch_params

         params.require(:launch).permit(:email, :operator_id)

  end

  def find_operator

      if params[:operator_id]
         @operator = Operator.find(params[:operator_id])
      end
      
   end


end
