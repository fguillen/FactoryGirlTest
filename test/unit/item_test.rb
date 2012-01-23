require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_format
    item = Factory(:item, :name => "the name", :format => "the format")
    assert_equal("the format", item.format)
  end

  def test_format_without_factory_girl
    item = Item.create!(:name => "the name", :format => "the format")
    assert_equal("the format", item.format)
  end
end
