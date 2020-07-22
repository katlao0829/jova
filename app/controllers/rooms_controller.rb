class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  before_action :partner_dm, only: [:show]


  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
       @directmessages = @room.directmessages
       @directmessage = Directmessage.new
       @entries = @room.entries
    else
       redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def partner_dm
    entry = @room.entries.where.not(user_id: current_user)
    @user = entry[0].user
  end

end
