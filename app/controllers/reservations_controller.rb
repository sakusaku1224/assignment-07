class ReservationsController < ApplicationController
  def index
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
end
