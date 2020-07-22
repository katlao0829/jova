class DirectmessagesController < ApplicationController
  # before_action :authenticate_user!, :only => [:create]
  before_action :set_group
   
  def create
    @directmessage = @room.directmessages.new(message_params)
    if @directmessage.save
      redirect_to room_path(@room), notice: 'メッセージが送信されました'
    else
      @directmessages = @room.directmessages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to room_path(@room)
    end
  end

  private

  def message_params
    params.require(:directmessage).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @room = Room.find(params[:room_id])
  end

end

