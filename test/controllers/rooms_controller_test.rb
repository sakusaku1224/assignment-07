require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get rooms_path
    assert_response :success
  end

  test "should get new" do
    get new_room_path
    assert_response :success
  end

  test "should create room" do
    assert_difference("Room.count") do
      post rooms_path, params: { room: { name: "新しい部屋", description: "説明", price: 1000, address: "東京都" } }
    end
    assert_redirected_to room_path(Room.last)
  end

  test "should get show" do
    get room_path(@room)
    assert_response :success
  end

  test "should get own" do
    get own_rooms_path
    assert_response :success
  end
end
