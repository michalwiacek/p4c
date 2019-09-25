require 'test_helper'

class VerticalTest < ActiveSupport::TestCase
  
  test "should not save vertical without name" do
    vertical = Vertical.new
    assert_not vertical.save
  end

  test "should not save vertical when category of same name exists" do
    category = Category.new
    category.vertical = Vertical.first
    category.name = "testName"
    category.save
    
    vertical = Vertical.new
    vertical.name = "testName"
    assert_not vertical.save
  end

end
