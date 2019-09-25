require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end

  test "should not save category with not uniq name" do
    category1 = Category.new
    category1.name = "TestName"
    
    category1.save

    category2 = Category.new
    category2.name = "TestName"
    assert_not category2.save
  end

  test "should not save category when vertical of same name exists" do
    vertical = Vertical.new
    vertical.name = "TestName"
    vertical.save

    category = Category.new
    category.name = "TestName"
    
    assert_not category.save
  end
end
