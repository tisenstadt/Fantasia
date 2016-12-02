require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:todd)
  end
  
  test "should get page" do
    get :show
    assert_response :success
  end
  
  test "should redirect when user not logged in" do
    get :new, id: @user
    assert_redirected_to new_user_session_url
  end
  
  test "create should require logged-in user" do
    assert_no_difference 'Page.count' do
      post :create 
    end
    assert_redirected_to new_user_session_url
  end
end
