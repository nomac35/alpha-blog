require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
       @category = Category.new(name: "sports")
       
    end

    test "category should be valid" do
        assert @category.valid?
    end
    
    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end
    
    test "name should ve uniqe" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end
    
    test "name should not be long" do
        @category.name = "a"*26
        assert_not @category.valid?
    
    end
    
    
    test "name should not be too short" do
        @category.name = "spo"
        assert_not @category.valid?
    end
end