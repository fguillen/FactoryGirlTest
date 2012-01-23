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

  def test_format_without_factory_girl_using_new
    item = Item.new

    item.name   = "the name"
    item.format = "the format"

    item.save!

    assert_equal("the format", item.format)
  end
end
