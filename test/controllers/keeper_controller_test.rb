require 'test_helper'

class KeeperControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get rank" do
    get :rank
    assert_response :success
  end

end
