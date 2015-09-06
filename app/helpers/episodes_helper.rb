module EpisodesHelper
  def episodes_data
    seasons = @episodes.group_by(&:season)
    min_rating = 10
    max_rating = 0

    grouped = @episodes.group_by(&:starts_at_formatted)
    grouped.each do |date, episodes|
      if episodes.size > 1
        episodes.each_with_index do |episode, index|
          episode.offset += index
        end
        puts [date, episodes.map(&:title)].join(', ')
      end
    end

    series = seasons.map do |season, episodes|
      episodes.map do |episode|
        starts_at = episode.starts_at.change(offset: 0)

        day_of_week = starts_at.strftime('%u').to_i
        beginning_of_week = DateTime.now.utc.beginning_of_week
        weekday = beginning_of_week + (day_of_week - 1).days
        if episode.offset > 0
          weekday -= (episode.offset * 2).hours
        end

        time_of_day = beginning_of_week.change(
          hour: starts_at.strftime('%k').to_i,
          min: starts_at.strftime('%M').to_i
        )

        rating = episode.imdb_rating
        min_rating = rating if rating < min_rating
        max_rating = rating if rating > max_rating

        {
          x: time_of_day.to_i * 1000,
          y: weekday.to_i * 1000,
          z: rating,
          name: episode.title,
          data: {
            director: episode.director,
            plot: episode.description,
            dateString: episode.starts_at_formatted,
            episode: episode.number,
            season: episode.season,
            poster: episode.poster_url
          }
        }
      end
    end

    series.each do |seasons|

    end

    data = {
      series: series,
      max_rating: max_rating,
      min_rating: min_rating
    }

    content_tag :input, nil, type: 'hidden', value: data.to_json, id: 'episodes-data'
  end
end
