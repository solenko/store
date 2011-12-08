require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
