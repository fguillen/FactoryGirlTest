require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  def test_format
    item = Factory(:thing, :name => "the name", :format => "the format")
    assert_equal("the format", item.format)
  end
end
