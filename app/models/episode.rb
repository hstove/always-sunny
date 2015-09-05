class Episode < ActiveRecord::Base
  validates_presence_of :season, :number, :title#, :day_of_week, :hour_of_day, :time_of_hour
  validates_uniqueness_of :number, scope: :season

  attr_writer :offset

  after_save do
    Rails.cache.clear
  end

  def starts_at_formatted
    starts_at.try(:strftime, '%l:%M%P on a %A')
  end

  def weekday
    starts_at.try(:strftime, '%A')
  end

  def time_of_day
    starts_at.try(:strftime, '%l:%M%P')
  end

  def offset
    @offset || 0
  end

  def self.to_csv
    columns = column_names
    columns.concat %w{starts_at_formatted weekday time_of_day}
    CSV.generate do |csv|
      csv << columns
      all.each do |product|
        csv << columns.map {|c| product.send(c) }
      end
    end
  end
end
