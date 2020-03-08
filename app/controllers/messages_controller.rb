class MessagesController < ApplicationController
  
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to users_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  
  def message_params
    params.permit(:content, :user_id, :mentee_id)
  end
end
