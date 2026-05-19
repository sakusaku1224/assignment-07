class RoomsController < ApplicationController
  before_action :set_room, only: [ :show, :edit, :update, :destroy ]
  def index
    # 新しい施設を上に表示する
    @rooms = Room.all.order(created_at: :desc)
    if params[:area].present?
      @rooms = @rooms.where("area LIKE ?", "%#{params[:area]}%")
    end
    if params[:keyword].present?
     @rooms = @rooms.where("name LIKE ?", "%#{params[:keyword]}%")
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "施設を保存しました"
    else
      flash.now[:alert] = "登録情報が不足しています"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    # @room実行済み
  end

  def own
    @rooms = current_user.rooms
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
  def room_params
    params.require(:room).permit(
      :name,
      :description,
      :price,
      :address,
      :image)
  end
end
