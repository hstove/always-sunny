module EpisodesHelper
  def episodes_data
    seasons = @episodes.group_by(&:season)
    series = seasons.map do |season, episodes|
      episodes.map do |episode|
        starts_at = episode.starts_at.change(offset: 0)

        day_of_week = starts_at.strftime('%u').to_i
        beginning_of_week = DateTime.now.utc.beginning_of_week
        weekday = beginning_of_week + (day_of_week - 1).days

        time_of_day = beginning_of_week.change(
          hour: starts_at.strftime('%k').to_i,
          min: starts_at.strftime('%M').to_i
        )

        puts [beginning_of_week, day_of_week, weekday, time_of_day].join(', ')

        {
          x: time_of_day.to_i * 1000,
          y: weekday.to_i * 1000,
          z: episode.imdb_rating,
          name: episode.title,
          data: {
            director: episode.director,
            plot: episode.description,
            dateString: episode.starts_at.strftime('%A at %l:%M %P'),
            episode: episode.number,
            season: episode.season
          }
        }
      end
    end

    content_tag :input, nil, type: 'hidden', value: series.to_json, id: 'episodes-data'
  end
end
