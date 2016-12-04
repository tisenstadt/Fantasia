require 'test_helper'

class StoryCreationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:todd)
  end
  
  test "invalid story submission" do
      sign_in @user
      get new_story_path
      assert_no_difference 'Story.count' do
          post stories_path, story: { title: nil }
      end
      assert_template 'stories/new'
      assert_select 'div#error_explanation'
  end
  
  test "valid story submission" do
      sign_in @user
      get new_story_path
      assert_difference 'Story.count', 1 do
          post stories_path, story:  { title: "adventure" }
      end
      follow_redirect!
      assert_template 'pages/new'
  end 
end
