require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "should get index" do
    get parts_path
    assert_response :success
  end


  test "should create part" do
    assert_difference('Part.count') do
      post parts_path, params: { part: { part_type: @part.part_type, description: @part.description, serial_number: @part.serial_number, bike_id: @part.bike_id, mounted_on: @part.mounted_on, purchased_on: @part.purchased_on } }
    end

    assert_redirected_to part_path(Part.last)
  end

  test "should show part" do
    get part_path(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_path(@part), params: { part: { part_type: @part.part_type, description: @part.description, serial_number: @part.serial_number, bike_id: @part.bike_id, mounted_on: @part.mounted_on, purchased_on: @part.purchased_on } }
    assert_redirected_to part_path(@part)
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_path(@part)
    end

    assert_redirected_to parts_path
  end
end
