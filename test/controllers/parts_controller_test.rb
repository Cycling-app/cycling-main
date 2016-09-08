require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "should get index" do
    get parts_path( format: :json )
    assert_response :success
  end


  test "should create part" do
    assert_difference('Part.count') do
      post parts_path( format: :json), params: {
        part: {
           part_type: @part.part_type,
           description: @part.description,
           serial_number: @part.serial_number,
           bike_id: @part.bike_id,
           mounted_on: @part.mounted_on,
           purchased_on: @part.purchased_on
          }
        }
    end

    assert_response :created
  end

  test "should show part" do
    get part_path(@part.id, format: :json )
    assert_response :success
  end

  test "should update part" do
    patch part_path(@part.id, format: :json ), params: {
       part: {
         part_type: @part.part_type,
         description: @part.description,
         serial_number: @part.serial_number,
         bike_id: @part.bike_id,
         mounted_on: @part.mounted_on,
         purchased_on: @part.purchased_on
        }
      }
    assert_response :success
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_path(@part.id, format: :json )
    end

    assert_response :no_content
  end
end
