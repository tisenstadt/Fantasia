require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
include Devise::Test::ControllerHelpers
  
  
  def setup
    @user = users(:todd)
  end
  
  test "should redirect when user is not logged in" do
    get :new
    assert_redirected_to new_user_session_url
  end

end
