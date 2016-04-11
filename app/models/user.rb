class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :readings
  validates :email, presence: true
  
#I didn't mean these to get quite as beefy as they got... I should abstract them into one function
#Note that this repeated querying is faster than trying to store all the results and grab min and max from that set in Rails
  def daily_average
    report = {
    'average' => readings.where(date_measured: Date.today).average(:glucose_level).to_f,
    'max' => readings.where(date_measured: Date.today).maximum(:glucose_level).to_f,
    'min' => readings.where(date_measured: Date.today).minimum(:glucose_level).to_f
    }
    report
  end
  
  def month_to_date_average
    report = {
      'average' => readings.where(:date_measured => Date.today.beginning_of_month..Date.today).average(:glucose_level),
      'max' => readings.where(:date_measured => Date.today.beginning_of_month..Date.today).maximum(:glucose_level),
      'min' => readings.where(:date_measured => Date.today.beginning_of_month..Date.today).minimum(:glucose_level)
    }
    report
  end
  
  def last_month_average(end_date)
    report = {
      'average' => readings.where(:date_measured => end_date.prev_month..end_date).average(:glucose_level),
      'max' => readings.where(:date_measured => end_date.prev_month..end_date).maximum(:glucose_level),
      'min' => readings.where(:date_measured => end_date.prev_month..end_date).minimum(:glucose_level)
    }
    report
  end
end
