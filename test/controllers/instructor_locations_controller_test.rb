require 'test_helper'

class InstructorLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get instructor_locations_destroy_url
    assert_response :success
  end

end
