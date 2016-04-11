class Reading < ActiveRecord::Base
    belongs_to :user
    validates :date_measured, presence: true
    validates :glucose_level, presence: true 
    validates :glucose_level, numericality: { only_integer: true, greater_than: -1, less_than: 200 }
end
