require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  
  def setup 
    @story = Story.new(title: "Sample Story")
  end
  
  test "should not accept long titles" do
    @story.title = "a" * 58
    assert_not @story.valid?
  end
  
  test "should not accept blank titles" do
    @story.title = ""
    assert_not @story.valid?
  end
    
end
