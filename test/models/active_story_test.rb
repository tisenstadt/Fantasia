require 'test_helper'

class ActiveStoryTest < ActiveSupport::TestCase
  def setup
    @user = users(:todd)
    @active = ActiveStory.new(user_id: @user.id, story_id: stories(:adventure).id)
  end
 
  test "active story is valid" do
    assert @active.valid?
  end
  
  test "active story must have user" do
    @active.user_id = nil
    assert_not @active.valid?
  end
  
  test "active story must have story present" do
    @active.story_id = nil
    assert_not @active.valid?
  end
end
