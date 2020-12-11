require 'test_helper'

class InstructorLanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get instructor_languages_destroy_url
    assert_response :success
  end

end
