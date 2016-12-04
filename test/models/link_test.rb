require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def setup
    @link = Link.new
  end
  
  test "ensure validity" do
    assert @link.valid?
  end
end
