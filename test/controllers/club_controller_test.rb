require 'test_helper'

class ClubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get club_index_url
    assert_response :success
  end

end
