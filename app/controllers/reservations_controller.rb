class ReservationsController < ApplicationController
  before_action :set_reservation, only: [ :edit, :update, :destroy ]
  def index
    # @reservations = Reservation.where(user_id: current_user.id)
    @reservations = current_user.reservations
  end

  def new
  end

  def create
    # セッションからデータを取り出して保存
    Reservation.create(
      room_id: session[:room_id],
      check_in: session[:check_in],
      check_out: session[:check_out],
      person_num: session[:person_num],
      total_price: session[:total_price],
      user_id: current_user.id
    )
    # セッションを削除
    session.delete(:room_id)
    session.delete(:check_in)
    session.delete(:check_out)
    session.delete(:person_num)
    session.delete(:nights)
    session.delete(:total_price)
    # セッションを削除した後に追加
    redirect_to reservations_path, notice: "予約が完了しました"
  end

  def confirm
    @room = Room.find(params[:room_id])
    @check_in = params[:check_in]
    @check_out = params[:check_out]
    @person_num = params[:person_num]
    @nights = Date.parse(@check_out) - Date.parse(@check_in)
    @total_price = @room.price * @person_num.to_i * @nights
    # セッションに保存
    session[:room_id] = params[:room_id]
    session[:check_in] = params[:check_in]
    session[:check_out] = params[:check_out]
    session[:person_num] = params[:person_num]
    session[:nights] = @nights
    session[:total_price] = @total_price
  end

  def edit
    # 既に＠reservation取得済み
    @room = @reservation.room
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: "予約情報を更新しました"
    else
      flash.now[:alert] = "予約情報が不足しています"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: "予約情報を削除しました"
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def reservation_params
    params.require(:reservation).permit(
      :check_in,
      :check_out,
      :person_num,
      :total_price
    )
  end
end
