class ChatsController < ApplicationController
  layout 'chats_second'
  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.new
    Chat.create(chat_params) 
    redirect_to chats_index_path 
  end

  private

  def chat_params
    params.permit(:content, :image)
  end
end
