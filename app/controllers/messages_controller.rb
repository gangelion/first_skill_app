class MessagesController < ApplicationController
  def index
    @messages = Message.where(user_id: current_user.id).order("created_at DESC")
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to users_path, notice: "メッセージを送信しました"
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.permit(:content, :user_id, :sender_id)
  end
end
