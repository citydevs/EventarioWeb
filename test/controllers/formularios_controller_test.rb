require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  test "should get por_post" do
    get :por_post
    assert_response :success
  end

end
