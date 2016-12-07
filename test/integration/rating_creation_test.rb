require 'test_helper'

class RatingCreationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:todd)
    @page = pages(:one)
  end
 
  test "cannot create rating if not logged in" do
    get page_path @page
    assert_template 'pages/show'
    assert_no_difference 'Rating.count' do
      post ratings_path, page_id: @page.id, rating: { page_id: @page.id, score: 5 }
    end
  end
  
  test "logged in user can rate a page" do
    sign_in @user
    get page_path @page
    assert_template 'pages/show'
    assert_difference 'Rating.count', 1 do
      post ratings_path, page_id: @page.id, rating: { page_id: @page.id, score: 5 }
    end
    assert_not flash.empty?
  end
  
  test "logged in user can only submit one rating per page" do
    sign_in @user
    get page_path @page
    assert_template 'pages/show'
    assert_difference 'Rating.count', 1 do
      post ratings_path, page_id: @page.id, rating: { page_id: @page.id, score: 5 }
    end
    assert_no_difference 'Rating.count' do
      post ratings_path, page_id: @page.id, rating: { page_id: @page.id, score: 1 }
    end
    assert_redirected_to root_url
  end
end
