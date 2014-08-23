require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  # TODO: figure out why the devise sign_in helper isn't setting controller#current_user
  #test 'setting linkedin profile' do
  #  @user = FactoryGirl.create(:user, :professional)
  #  sign_in @user
  #  
  #  patch :update, user: { linkedin_profile: 'http://www.linkedin.com/pub/test-user' }
  #  assert_redirected_to profile_path(assigns(:user))
  #  @user.reload
  #  assert_equal @user.linkedin_profile, 'http://www.linkedin.com/pub/test-user'
  #end
end
