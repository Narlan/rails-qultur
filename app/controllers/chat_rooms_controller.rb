class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end

  def new
    @users = []
    User.all.each do |user|
      @users << user.nickname
    end
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new
    @chat_room.user = User.find(params[:query][:name])
    if current_user == @user
      @chat_room.name = "Chat with #{@current_user.first_name}"
    else
      @chat_room.name = "Chat with #{@current_user.first_name}"
    end
    @chat_room.save
    redirect_to "/users/#{current_user.id}/chat_rooms/#{@chat_room.id}"
  end

  # private

  # def params_chatroom
  #   params.require(:chat_room).permit(:name)
  # end
end
