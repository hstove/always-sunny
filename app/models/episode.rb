class Episode < ActiveRecord::Base
  validates_presence_of :season, :number, :title#, :day_of_week, :hour_of_day, :time_of_hour
  validates_uniqueness_of :number, scope: :season

  attr_writer :offset

  after_save do
    Rails.cache.clear
  end

  def starts_at_formatted
    starts_at.strftime('%l:%M%P on a %A')
  end

  def offset
    @offset || 0
  end
end
