require 'test_helper'

class EnterReadingTest < ActionDispatch::IntegrationTest
  test "invalid reading information" do
    assert_no_difference 'Reading.count' do
      post readings_path, reading: { user_id: 1, glucose_level: 500, date_measured: Date.today }
    end
  end

end
