class Episode < ActiveRecord::Base
  validates_presence_of :season, :number, :title#, :day_of_week, :hour_of_day, :time_of_hour
  validates_uniqueness_of :number, scope: :season
end
