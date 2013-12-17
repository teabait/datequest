class MessagesController < ApplicationController
  def new
    @message = Message.new
    render :new
  end

  def create
    message_params = get_params
    message_params[:sender_id] = current_user.id
    message_params[:receiver_id] = params[:user_id]
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_messages_path(current_user.id)
    else
      redirect_to root_path
    end

  end

  def index
    @messages = Message.where(
      receiver_id: current_user.id
    )
  end

  private

  def get_params
    params.require(:message).permit(:subject, :content)
  end
end
