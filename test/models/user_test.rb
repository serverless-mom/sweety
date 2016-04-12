require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
  end

  test "should be valid" do
    assert @user.valid?
  end
 
  test "email shouldn't be empty string" do
    @user.email = "      "
    assert_not @user.valid?
  end
  
  test "returns a daily average" do
    assert @user.daily_average
  end
  
  test "returns month_to_date_average" do
    assert @user.month_to_date_average
  end
end