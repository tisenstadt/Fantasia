require 'test_helper'

class PageTest < ActiveSupport::TestCase
  def setup
    @page = pages(:one)
  end
  
  test "ensure validity" do
    assert @page.valid?
  end
  
  test "page must have content" do
    @page.content = nil
    assert_not @page.valid?
  end
  
  test "page must have title" do
    @page.page_title = nil
    assert_not @page.valid?
  end
end
