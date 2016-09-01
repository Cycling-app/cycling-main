require 'test_helper'

class BikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bike = bikes(:one)
  end

  test "should get index" do
    get bikes_path( format: :json )
    assert_response :success
  end

  test "should create bike" do
      assert_difference('Bike.count') do
      post bikes_path( format: :json ), params: { bike: { name: @bike.name, bought_on: @bike.bought_on, brand: @bike.brand, client_id: @bike.client_id, model: @bike.model, serial_number: @bike.serial_number } }
    end

    assert_redirected_to bike_path(Bike.last)
  end

  test "should show bike" do
    get bike_path(@bike)
    assert_response :success
  end

  test "should update bike" do
    patch bike_path(@bike), params: { bike: { name: @bike.name, bought_on: @bike.bought_on, brand: @bike.brand, client_id: @bike.client_id, model: @bike.model, serial_number: @bike.serial_number } }
    assert_redirected_to bike_path(@bike)
  end

  test "should destroy bike" do
      assert_difference('Bike.count', -1) do
      delete bike_path(@bike)
    end

    assert_redirected_to bikes_path
  end
end
