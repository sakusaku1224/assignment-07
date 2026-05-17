class RoomsController < ApplicationController
  def index
    # 新しい施設を上に表示する
    @rooms = Room.all.order(created_at: :desc)
    if params[:area].present?
      @rooms = @rooms.where("area LIKE ?", "%#{params[:area]}%")
    end
    if params[:keyword].present?
     @rooms = @rooms.where("title LIKE ?", "%#{params[:keyword]}")
    end
  end

  def new
  end

  def create
  end

  def show
    @room = Room.find(params[:id])
  end

  def own
  end
end
