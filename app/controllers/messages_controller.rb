class MessagesController < ApplicationController

	layout 'static'


  def new
    @message = Message.new
  end



  def create

    @message = Message.new message_params

    if @message.valid?

      MessageMailer.contact_me(@message).deliver_now

      redirect_to new_message_url, notice: "Message received, thanks!"

    else

      render :new

    end





    

  end




  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end  


end
