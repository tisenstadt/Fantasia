require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @page = pages(:one)
  end
  
  test "should get page" do
    get :show, id: @page
    assert_response :success
  end
  
  test "should redirect when user not logged in" do
    get :new
    assert_redirected_to new_user_session_url
  end
  
  test "create should require logged-in user" do
    assert_no_difference 'Page.count' do
      post :create, {content: "Page", page_title: "Page"}
    end
    assert_redirected_to new_user_session_url
  end
end
