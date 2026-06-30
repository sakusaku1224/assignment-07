require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
    @room = rooms(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get reservations_path
    assert_response :success
  end

  test "should get new" do
    get new_reservation_path(room_id: @room.id)
    assert_response :success
  end

  test "should create reservation" do
    # createはセッションの値を使うため、先にconfirmを通してセッションを作る
    post confirm_reservations_path, params: { room_id: @room.id, check_in: 1.day.from_now.to_date, check_out: 2.days.from_now.to_date, person_num: 1 }

    assert_difference("Reservation.count") do
      post reservations_path
    end
  end

  test "should get confirm" do
    get confirm_reservations_path, params: { room_id: @room.id, check_in: 1.day.from_now.to_date, check_out: 2.days.from_now.to_date, person_num: 1 }
    assert_response :success
  end
end
