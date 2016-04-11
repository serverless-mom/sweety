require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
    def setup
        @reading = Reading.new(:glucose_level => 122, :date_measured => Date.today)
    end
  
    test "should be valid" do
        assert @reading.valid?
    end
    
    test "reading can't be above 200" do
        @reading.glucose_level = 222
        assert_not @reading.valid?
    end
    
    test "can't create 5 readings for one day" do
        4.times do
            Reading.create(:glucose_level => 122, :date_measured => Date.today)
        end
        @reading.save
        assert @reading.errors.any?
    end
    

end