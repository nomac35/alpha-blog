require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "alper69", email: "alper.t@gmail.com", password: "password", admin: true)
    
    end
    
    test "should get categories index" do
        get :index
        assert_response :success
    end 
    
    test "should get new" do
        session[:user_id] = @user.id
        get :new
        assert_response :success
    end
    
    test "should get show" do
        get(:show, { 'id' => @category.id })
        assert_response :success
    end
    
    test "should redirect create if admin not logged_in" do
       assert_no_difference 'Category.count' do
        post :create, category: {name: "sports" }
    end
    assert_redirected_to categories_path
end
end
