class RoomsController < ApplicationController
  before_action :set_room, only: [ :show, :edit, :update, :destroy ]
  def index
    # 新しい施設を上に表示する
    @rooms = Room.all.order(created_at: :desc)
    if params[:area].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
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
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room), notice: "施設が作成されました。"
    else
      flash.now[:alert] = "登録情報が不足しています"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    # @room は set_room で取得済み
  end

  def edit
    # @room は set_room で取得済み
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "施設情報を更新しました"
    else
      flash.now[:alert] = "更新情報が不足しています"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to own_rooms_path, notice: "施設を削除しました"
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
