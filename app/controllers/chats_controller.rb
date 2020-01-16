class ChatsController < ApplicationController
  layout 'chats_second'
  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.new
    @chating = Chat.create(chat_params) 
    respond_to do |format|
      format.html { redirect_to chats_path }
      format.json
    end
  end

  private

  def chat_params
    params.permit(:content, :image)
  end
end
