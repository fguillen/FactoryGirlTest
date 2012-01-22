require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_format
    item = Factory(:item, :name => "the name", :format => "the format")
    assert_equal("the format", item.format)
  end
end
