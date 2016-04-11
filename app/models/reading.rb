class Reading < ActiveRecord::Base
    belongs_to :user
    validates :date_measured, presence: true
    validates :glucose_level, presence: true 
    validates :glucose_level, numericality: { only_integer: true, greater_than: -1, less_than: 200 }
    validate :four_readings_per_day
    
    
    private
    def four_readings_per_day
        if Reading.where(user_id: user_id, date_measured: date_measured).count > 3
            errors.add(:date_measured, "already 4 readings for this day")
        end
    end
end
