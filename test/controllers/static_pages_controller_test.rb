require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end
  
  test "reports should render correct template" do
    get :home
    assert_template :home
  end

end
