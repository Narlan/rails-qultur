class MessagesController < ApplicationController
   skip_before_action :verify_authenticity_token
  def create
    @message = Message.new(message_params)
    t = Time.now
    @message.published_at = "#{t.hour}:#{t.min}"
    @message.published_at = t.strftime("%H:%M")

    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to "/users/#{@current_user.id}/chat_rooms/#{@chat_room.id}" }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :published_at)
  end
end
