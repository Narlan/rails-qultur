class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.where(params[:id] == current_user.id)
  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end

  def new
    @users = User.all
    @chat_room = ChatRoom.new
  end

  def create
      @chat_room = ChatRoom.new
      @chat_room.user = User.find(params[:query][:user_id])
      if current_user == @user
        @chat_room.name = "Chat with #{@chat_room.user.nickname}"
      else
        @chat_room.name = "Chat with #{@chat_room.user.nickname}"
      end
      @chat_room.save
      redirect_to "/users/#{current_user.id}/chat_rooms/#{@chat_room.id}"
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.destroy
    redirect_to user_chat_rooms_path(current_user)
  end
end
