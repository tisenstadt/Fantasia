require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  def setup
    @choice = choices(:firstchoice)
  end
  
  test "ensure validity" do
    assert @choice.valid?
  end
  
  test "ensure content presence" do
    @choice.content = nil
    assert_not @choice.valid?
  end
  
  test "ensure choice has a page" do
    @choice.page_id = nil
    assert_not @choice.valid?
  end
end
