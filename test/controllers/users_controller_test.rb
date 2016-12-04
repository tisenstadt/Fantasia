require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  def setup
    @user = users(:todd)
  end
  
  test "should redirect when not logged in" do
    get :show, id: @user
    assert_redirected_to new_user_session_url
  end

end
