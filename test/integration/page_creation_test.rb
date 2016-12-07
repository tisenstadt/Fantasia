require 'test_helper'

class PageCreationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:todd)
    @story = stories(:adventure)
  end
  
  test "invalid page submission" do
     sign_in @user
     get story_path @story
     assert_template 'stories/show'
     assert_no_difference 'Page.count' do
       post pages_path, story_id: @story.id, page: { page_title: "mypage", content: nil }
     end
     assert_template 'pages/new'
     assert_select 'div#error_explanation'
  end
  
  test "valid page submission" do
     sign_in @user
     get story_path @story
     assert_template 'stories/show'
     assert_difference 'Page.count', 1 do
       post pages_path, story_id: @story.id, page: { page_title: "mypage", content: "content" }
     end
     follow_redirect!
     assert_template 'pages/add_choices'
     assert_not flash.empty?
  end
end
