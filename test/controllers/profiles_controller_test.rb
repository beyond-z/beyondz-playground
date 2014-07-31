require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tester).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should get a error page when profile does not exist" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end
  
  test "should get user data when the profile page is successfully loaded" do
    get :show, id: users(:tester).profile_name
    assert assigns(:user)
  end
end
