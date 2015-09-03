module EpisodesHelper
  def episodes_chart
    series = @episodes.map do |episode|
      day_of_week = episode.starts_at.strftime('%u').to_i
      minutes_in_day = episode.starts_at - episode.starts_at.beginning_of_day
      rating = episode.imdb_rating

      [minutes_in_day, day_of_week, rating]
    end
    chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title text: 'All Episodes'
      f.chart type: 'bubble', zoomType: 'xy'
      f.series data: series
      f.yAxis [
        {
          min: 0,
          max: 8
        }
      ]
      f.xAxis [
        {
          min: 0,
        }
      ]
    end

    high_chart 'episodes_chart', chart
  end
end
