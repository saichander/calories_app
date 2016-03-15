require 'test_helper'

class BodyMetricsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
